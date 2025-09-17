Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C221B9FD
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094379; cv=none; b=VHYK6WXhbIOIQlhIdPraqtaeauYW/d5SzLoFR76fs4L4NH35hBNblRjMsynAxXXYeqfEC5m7fyv6smSeDOE2pMkhqF/c9seVfJz/UOl60uOBabnRH3rCFOpDPLAWTsKwXfHM6aJE50Wxwa0OwclIOfztLtWFR2aIRuKN4AXGhKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094379; c=relaxed/simple;
	bh=eCYXJzo5m35j8hJQiDG8cjwLDvRfKAgYtylXrSmcRok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLkMkHOFkVlZAJrYDdZyTQqZvrsTeKbh54BWudA1XhXi+8WiJ3r0D4rDGDNaW1nKOzp87Sim5QJWk+VR4bebolefnaah+572cTeE6jezHkWIsiDyuWVHh0Agl/lob8Bj6tztfslJU6j1p8gtYEoU8Ua4GYS7lAksjHDocbnzOVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLmkfube; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLmkfube"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4619eb18311so2905285e9.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758094373; x=1758699173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivNUuHI0POvr17goW1FI7bdjUYorxzKhYbrqovFRDAg=;
        b=NLmkfubeOb+q5jfvQTPkVUfNJYkc4D32oTC2kafnoUsv1ZPHPoA+9WFwMRCtRzHfd3
         0PaGyY37qS/Dwp2Fk1xTAdiqZZnJEY8AZSZ3MDz6EBoxqfWKiz0j/udyz3PR+B72UXDR
         4EoHEphGei7Njt0Xk8OQwIaOSLvC0G85ILqaxf46dw/c62OF1Z5Fyg0V0aa4h/O2CUw/
         GKlBHUchZ1eLHq3csbrKM+jTZ8YGiNBTyIb14ljYBK6SMMbWW1Ye7V3tFExXheLnZ2BS
         +cKQD5LSP7va6suv1IRsRDZe7whQfIUTwe0MAU163+h3BSZWYAjo5j01XDpKmlq3QxTP
         kkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094373; x=1758699173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivNUuHI0POvr17goW1FI7bdjUYorxzKhYbrqovFRDAg=;
        b=nhr+/mqUJ7MQE9clW0cy/erjeGZum1N46HH12iSY0JvHSi0MxhbE5HbjjZL1/YrXeX
         b+ChkIS/4wBwpjqtbD/4pepUwRXxloWgPD/MOAJyVz9Ll29YinVAAvmth/WPxJ8whZDJ
         xw42azWRsm6CeYGkJQjKqRHYQ1OHslD5ocvGS6qvA0AvGe1t9FOVwjhOCK6BOoWYWyHJ
         HzfxBTDmOv3rNzeGzHPSneEGYNEo0zkxOCwwq2gtuMcmJ7rSNSLDN1JvDrpMOyB5kWxC
         HkNmiMdEV1ftmzouJ8qfm1w0erz5YLelqDvdxabSdMfMrZxyICFTabSE3NBN/vBki25o
         S3yA==
X-Forwarded-Encrypted: i=1; AJvYcCWQntyZvbYbYHJ2nRxzJa3Sgh2yzf3qLY1AlEyAakkFHv9Lvx9dBLMh+Q2+4XfMT9g/4r4Mcldt5IkGOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysxVXUPOZlMsQoQv6uCAdvRLYQAG8NE9NfzjE08lyopnNRkSnM
	USFxmrG3DMgoxH6JTcrp1fFQ4AujaFHrMSrwZLrd+iUQWmVXGyot0lxOegIT4kKQDGv3VNGze9h
	NHLIl
X-Gm-Gg: ASbGncuKB2+eGMeJF2Sp64iUzMXeYPQ1IZTLGqRZU0j7VYLiyFZYWg+DD4snMJB9X3n
	3GsHZCSHZ+NSLKlp5Y5yfBGz+F93Yj4GtUOLUnO1wKBE+hPpggePdLK4/Jid3pXz5wjmMkqe0y4
	t2FWLVRwAPZFm/gLwb2DMKM57JaUv28p0y3xUlaZRS3nE093hTQC81A1eqLK+rFvmEIsuP04sVS
	s305dahVHFKp8u9g4AeJ780/jxB0ygkMt3MM7GTsb512s+fjg+RRlNVwZ3jFHnxmmtC94gu9Vsa
	mpB7x0Z21ZmFRgVqNNJdURIuFYslNZld1X2HFP9XA2VGyPTrOxgDZ6SMU8n5ILLD8BA77XGxVMb
	Dvk2C9/X1hhCsPaBczO2rCnm3M28i7Rtc2Zz1UFI=
X-Google-Smtp-Source: AGHT+IEDokaqI9K94dDKvvgnGzxx8bF/zgdMFVrvUHzAt9R9Nl/uLKSr4AYRxA++O9rkJ0BNXhJagg==
X-Received: by 2002:a05:600c:4ec8:b0:45f:2843:e76d with SMTP id 5b1f17b1804b1-46201f8a9f5mr9858205e9.4.1758094373157;
        Wed, 17 Sep 2025 00:32:53 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:75ac:2ea2:dfdc:89c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613eb27f25sm25442035e9.23.2025.09.17.00.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:32:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 17 Sep 2025 08:32:50 +0100
Subject: [PATCH v3 1/3] ALSA: compress: add raw opus codec define and opus
 decoder structs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-opus_codec_rfc_v1-v3-1-7737ad40132e@linaro.org>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
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
2.47.3

