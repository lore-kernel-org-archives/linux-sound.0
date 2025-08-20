Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA847236451
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 21:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724577; cv=none; b=XQqngUq+GVbY7a+XYCmuV6tQhsXdk1Fg7TI7w6tpEhkL40aQMCL5WLdXNQ1eWOvY+g4SWMJD/BroAIdL4RubIjgeBwF4ZrOPFnqoSomZtvVDQXw8aO6fu3nCHdROrab9wBLo333ZONxaM2FvtWL6o5104fP/XDYn7sz0ObFxQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724577; c=relaxed/simple;
	bh=x/i6YSno0uZn+m73vZYG7p5SK1WjGPZPgx8s0L4S1+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiMbOGOE0NAt03hsk/85Da+LPlHSVz7if8kQuVdH4fnw4wyPkgnJo3LJCUFuPKGfsVtsrNUwlx08HRbN298QnYW1GvwtoajOmrPyokAv5CMyWnC3EKtXdM7Zdt1D6ms1J6fdmcvv5QHYJIAQnlh7C8LBukR/sv8JAAtNGnluJNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qp3FEFXK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qp3FEFXK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso2164915e9.1
        for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755724572; x=1756329372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHnq1zNUNjsCGwo2uZ1IBjHQWm9iZco+f3TAzh7Rxzk=;
        b=Qp3FEFXKJmIMI3bIWzyH2YRNxjTxneBBGW90yvIWRB95N7ovaa3FEdbAKQ/P12uuF9
         pNkBpXHoFcQPvpunJTGREWlSyFMBrmdZJ37WsfDsMd9WkFMCvT8yPu1v34L3BJxiD3oT
         5VXUFH53N5JmJ1F3lo2mSiHHW9cL59Hfu/DAu98zG+OaeH8WCPgfqPTChAQyyCIKB5ir
         7JmUOaiM/lOCQDrhH0J6N2eQ9OFPX2G7X0cG24eFw4gIIRVV85wJaZu5M31MSjiJaMwK
         3zv8AT6lUb8C/aMRTo/MZ8YP9VNlx+PKL7CgVepJAe3zGssEgzx+AdPh1fP+iilBI5z8
         zdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755724572; x=1756329372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHnq1zNUNjsCGwo2uZ1IBjHQWm9iZco+f3TAzh7Rxzk=;
        b=F5uXgkr3upIB5eEeNFqmyjd0AOisNGAbenPvKaEuggc53rI9BfZlx2AyFu7UFHSUv2
         2tG/plSWIZpJPOEhHQaA3UXc/tvDZx2NcrkpAcXhYI7SBXr8anhHzSPD/alrRgaRCOr3
         JexywxUDc9tii5dZJYoynuGs3kz6lkNgjkIMNb9BxKYEP6D+98ACEXsUypmUY8ys4cWl
         YvOGBoxsWZ4aVhjmxIo8tpoNEB3WzYLEoT9/QCwoCF5LJeG8cP9RD5DJ1r2WM6KVuhIR
         ca8zg7Vqt1f6iu6gDwnZX+kEJJOQEAgiAAbpkCC3eD1TB4n4gU7OVKEWFQv5ODQPdNrd
         z+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVqcVYrTTVS0RwWWRmrNHT++3nA72aoYmd361XGl04R9DygfCUPpQj6M2KJrXDCzycEk/YhABT++LpgOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7NwWwyhemdJKZYpdUoJ5c6s2c272ap0tyI7KSquXh/2h2R/a
	lj17exhZkX1nif5JzhlMDgEguEoOIS35E2Bji59+Fhu3G8xC/HpLK0xAu6hjZ/DaHSA=
X-Gm-Gg: ASbGncv2ybNTMx+aa0HaIK8WBuX0Dr8AWO+STl0MGykVPEk+InLWxhlIaVw94vKHltx
	7XVhFOkV2Twj59pO4SqxcixjKlxmhsCGwA7YR+twhofzFhNorUJhxi113oP9sPzoyIGY3cutsyR
	Orzf3AuCEbhcHX0mhSIknJPYO9DxOBcsbBzylbPNnVW5Gu0XIIxDd9np1FbdMdkn+/47Hf7ACUZ
	keu/SpZ2+FQs9giVsU33fxq05KvTydQ601E1L5qb3y0LgZMt+WGU2odmKpCtoIRsNfhK93CQc/a
	MK0SrDSuiNiDm08Q3OMM3VCBDrjfTtx0bdR+U+HLOKKqbFnH9OqMWV6k93ipy27DW/iU2KINmmH
	VRpEQKvUeJoweFDHwCy5c7u8impBEKCBZ1qAQRGg=
X-Google-Smtp-Source: AGHT+IF6mc6i3GB80pU+NXSZj3BrVHUS/irruglP4BirKVhRoCkCZCYy4zY2P7/VCJuci1L8rEovxg==
X-Received: by 2002:a05:600c:630d:b0:459:e3a1:a0c4 with SMTP id 5b1f17b1804b1-45b4d865e87mr42375e9.30.1755724572081;
        Wed, 20 Aug 2025 14:16:12 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:41e2:cc8d:197b:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4d7b2948sm162105e9.0.2025.08.20.14.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 14:16:11 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 20 Aug 2025 22:15:59 +0100
Subject: [PATCH 1/2] ALSA: compress: add raw opus codec define and opus
 decoder structs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-opus_codec_rfc_v1-v1-1-54d5c7560856@linaro.org>
References: <20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org>
In-Reply-To: <20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, 
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

Adds a raw opus codec define and raw opus decoder structs.
This is for raw OPUS packets not packed in any type of container
(for instance OGG container). The decoder struct fields are
taken from corresponding RFC document: RFC 7845 Section 5.

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Co-developed-by: Annemarie Porter <annemari@quicinc.com>
Signed-off-by: Annemarie Porter <annemari@quicinc.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/uapi/sound/compress_params.h | 43 +++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index bc7648a30746f4632ecf6695868e79550a431dfa..faf4fa911f7fc2830c3ae42b93650fe40d8a776b 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -43,7 +43,8 @@
 #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
 #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
 #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
-#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
+#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
+#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
 
 /*
  * Profile and modes are listed with bit masks. This allows for a
@@ -324,6 +325,45 @@ struct snd_dec_ape {
 	__u32 seek_table_present;
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_dec_opus - Opus decoder parameters (raw opus packets)
+ * @version: Usually should be '1' but can be split into major (4 upper bits)
+ * and minor (4 lower bits) sub-fields.
+ * @num_channels: Number of output channels.
+ * @pre_skip: Number of samples to discard at 48 kHz.
+ * @sample_rate: Sample rate of original input.
+ * @output_gain: Gain to apply when decoding (in Q7.8 format).
+ * @mapping_family: Order and meaning of output channels. Only values 0 and 1
+ * are expected; values 2..255 are not recommended for playback.
+ *
+ * Optional channel mapping table. Describes mapping of opus streams to decoded
+ * channels.
+ * @struct snd_dec_opus_ch_map
+ *	@stream_count: Number of streams encoded in each Ogg packet.
+ *	@coupled_count: Number of streams whose decoders are used for two
+ *		channels.
+ *	@channel_map: describes which decoded channel to be used for each one.
+ *		See RFC doc for details.
+ *		This supports only mapping families 0 and 1, therefore max
+ *		number of channels is 8.
+ *
+ * These options were extracted from RFC7845 Section 5.
+ */
+
+struct snd_dec_opus {
+	__u8 version;
+	__u8 num_channels;
+	__u16 pre_skip;
+	__u32 sample_rate;
+	__u16 output_gain;
+	__u8 mapping_family;
+	struct snd_dec_opus_ch_map {
+		__u8 stream_count;
+		__u8 coupled_count;
+		__u8 channel_map[8];
+	} chan_map;
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
@@ -334,6 +374,7 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct snd_dec_opus opus_d;
 	struct {
 		__u32 out_sample_rate;
 	} src_d;

-- 
2.47.2

