#
# Copyright (C) YuqiaoZhang(HanetakaChou)
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# https://developer.android.com/ndk/guides/android_mk

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := webp

LOCAL_SRC_FILES := \
	$(LOCAL_PATH)/../sharpyuv/sharpyuv.c \
	$(LOCAL_PATH)/../sharpyuv/sharpyuv_cpu.c \
	$(LOCAL_PATH)/../sharpyuv/sharpyuv_csp.c \
	$(LOCAL_PATH)/../sharpyuv/sharpyuv_dsp.c \
	$(LOCAL_PATH)/../sharpyuv/sharpyuv_gamma.c \
	$(LOCAL_PATH)/../sharpyuv/sharpyuv_sse2.c \
	$(LOCAL_PATH)/../src/dec/alpha_dec.c \
	$(LOCAL_PATH)/../src/dec/buffer_dec.c \
	$(LOCAL_PATH)/../src/dec/frame_dec.c \
	$(LOCAL_PATH)/../src/dec/idec_dec.c \
	$(LOCAL_PATH)/../src/dec/io_dec.c \
	$(LOCAL_PATH)/../src/dec/quant_dec.c \
	$(LOCAL_PATH)/../src/dec/tree_dec.c \
	$(LOCAL_PATH)/../src/dec/vp8l_dec.c \
	$(LOCAL_PATH)/../src/dec/vp8_dec.c \
	$(LOCAL_PATH)/../src/dec/webp_dec.c \
	$(LOCAL_PATH)/../src/dsp/alpha_processing.c \
	$(LOCAL_PATH)/../src/dsp/alpha_processing_sse2.c \
	$(LOCAL_PATH)/../src/dsp/alpha_processing_sse41.c \
	$(LOCAL_PATH)/../src/dsp/cost.c \
	$(LOCAL_PATH)/../src/dsp/cost_sse2.c \
	$(LOCAL_PATH)/../src/dsp/cpu.c \
	$(LOCAL_PATH)/../src/dsp/dec.c \
	$(LOCAL_PATH)/../src/dsp/dec_clip_tables.c \
	$(LOCAL_PATH)/../src/dsp/dec_sse2.c \
	$(LOCAL_PATH)/../src/dsp/dec_sse41.c \
	$(LOCAL_PATH)/../src/dsp/enc.c \
	$(LOCAL_PATH)/../src/dsp/enc_sse2.c \
	$(LOCAL_PATH)/../src/dsp/enc_sse41.c \
	$(LOCAL_PATH)/../src/dsp/filters.c \
	$(LOCAL_PATH)/../src/dsp/filters_sse2.c \
	$(LOCAL_PATH)/../src/dsp/lossless.c \
	$(LOCAL_PATH)/../src/dsp/lossless_enc.c \
	$(LOCAL_PATH)/../src/dsp/lossless_enc_sse2.c \
	$(LOCAL_PATH)/../src/dsp/lossless_enc_sse41.c \
	$(LOCAL_PATH)/../src/dsp/lossless_sse2.c \
	$(LOCAL_PATH)/../src/dsp/lossless_sse41.c \
	$(LOCAL_PATH)/../src/dsp/rescaler.c \
	$(LOCAL_PATH)/../src/dsp/rescaler_sse2.c \
	$(LOCAL_PATH)/../src/dsp/ssim.c \
	$(LOCAL_PATH)/../src/dsp/ssim_sse2.c \
	$(LOCAL_PATH)/../src/dsp/upsampling.c \
	$(LOCAL_PATH)/../src/dsp/upsampling_sse2.c \
	$(LOCAL_PATH)/../src/dsp/upsampling_sse41.c \
	$(LOCAL_PATH)/../src/dsp/yuv.c \
	$(LOCAL_PATH)/../src/dsp/yuv_sse2.c \
	$(LOCAL_PATH)/../src/dsp/yuv_sse41.c \
	$(LOCAL_PATH)/../src/enc/alpha_enc.c \
	$(LOCAL_PATH)/../src/enc/analysis_enc.c \
	$(LOCAL_PATH)/../src/enc/backward_references_cost_enc.c \
	$(LOCAL_PATH)/../src/enc/backward_references_enc.c \
	$(LOCAL_PATH)/../src/enc/config_enc.c \
	$(LOCAL_PATH)/../src/enc/cost_enc.c \
	$(LOCAL_PATH)/../src/enc/filter_enc.c \
	$(LOCAL_PATH)/../src/enc/frame_enc.c \
	$(LOCAL_PATH)/../src/enc/histogram_enc.c \
	$(LOCAL_PATH)/../src/enc/iterator_enc.c \
	$(LOCAL_PATH)/../src/enc/near_lossless_enc.c \
	$(LOCAL_PATH)/../src/enc/picture_csp_enc.c \
	$(LOCAL_PATH)/../src/enc/picture_enc.c \
	$(LOCAL_PATH)/../src/enc/picture_psnr_enc.c \
	$(LOCAL_PATH)/../src/enc/picture_rescale_enc.c \
	$(LOCAL_PATH)/../src/enc/picture_tools_enc.c \
	$(LOCAL_PATH)/../src/enc/predictor_enc.c \
	$(LOCAL_PATH)/../src/enc/quant_enc.c \
	$(LOCAL_PATH)/../src/enc/syntax_enc.c \
	$(LOCAL_PATH)/../src/enc/token_enc.c \
	$(LOCAL_PATH)/../src/enc/tree_enc.c \
	$(LOCAL_PATH)/../src/enc/vp8l_enc.c \
	$(LOCAL_PATH)/../src/enc/webp_enc.c \
	$(LOCAL_PATH)/../src/utils/bit_reader_utils.c \
	$(LOCAL_PATH)/../src/utils/bit_writer_utils.c \
	$(LOCAL_PATH)/../src/utils/color_cache_utils.c \
	$(LOCAL_PATH)/../src/utils/filters_utils.c \
	$(LOCAL_PATH)/../src/utils/huffman_encode_utils.c \
	$(LOCAL_PATH)/../src/utils/huffman_utils.c \
	$(LOCAL_PATH)/../src/utils/quant_levels_dec_utils.c \
	$(LOCAL_PATH)/../src/utils/quant_levels_utils.c \
	$(LOCAL_PATH)/../src/utils/random_utils.c \
	$(LOCAL_PATH)/../src/utils/rescaler_utils.c \
	$(LOCAL_PATH)/../src/utils/thread_utils.c \
	$(LOCAL_PATH)/../src/utils/utils.c

LOCAL_CFLAGS :=

ifeq (armeabi-v7a,$(TARGET_ARCH_ABI))
LOCAL_ARM_MODE := arm
LOCAL_ARM_NEON := true
else ifeq (arm64-v8a,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS +=
else ifeq (x86,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS += -mf16c
LOCAL_CFLAGS += -mfma
LOCAL_CFLAGS += -mavx2
else ifeq (x86_64,$(TARGET_ARCH_ABI))
LOCAL_CFLAGS += -mf16c
LOCAL_CFLAGS += -mfma
LOCAL_CFLAGS += -mavx2
else
LOCAL_CFLAGS +=
endif

LOCAL_CFLAGS += -Wall
LOCAL_CFLAGS += -Werror=return-type

LOCAL_CFLAGS += -DWEBP_DLL
LOCAL_CFLAGS += -DHAVE_CONFIG_H

LOCAL_C_INCLUDES :=
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_CPPFLAGS := 
LOCAL_CPPFLAGS += -std=c++20

LOCAL_LDFLAGS :=
LOCAL_LDFLAGS += -Wl,--enable-new-dtags
LOCAL_LDFLAGS += -Wl,-rpath,\$$ORIGIN
LOCAL_LDFLAGS += -Wl,--version-script,$(LOCAL_PATH)/webp.map
LOCAL_LDFLAGS += -lm

LOCAL_STATIC_LIBRARIES :=

include $(BUILD_SHARED_LIBRARY)
