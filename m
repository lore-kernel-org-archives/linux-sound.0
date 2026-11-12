Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456120;
	b=zzI9Isjagjg67Cacv2ZtHUDq8to65TQkfs95zwiDHbW42cqrXCiZm9QfhdEPw2rTl9pu
	 L8tDj9s9H3jX/xjiD0OrJJ1zJgRFYIywws6AGoE4Jhwx1xhst0cMjvcVeNAkYH12SD69t
	 88GaH2s3dp5YU+n1dejjmqUK7WJAJ9MqikLeX0I7R/Y7vqT/GZ2+9lXVwN0ALQoO9rItP
	 atx2zRk9DcmCuy1ik9Yd5yA5g1Vew8PqNiN++gJ+ZUEndSemJx/vmLz2Di8G8uE6HSopf
	 +cy+30BqthSa9tx6yaJbXj0ga0CY6zfE+Cp5jTL1AXuCp0EbhYRc13au/siPdlfCjEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=N2LLM4DBtKMrmpo5mqaQsURV/pMMXl4CIcJIhacgRMA=;
	b=xYoqX9ARnZrJOcfn3sHWeB6ehRbClLlPvFvv6kDe6oxPl0LiATZLt9n78jfugJDBOC9E
	 V6xD7MoDgRHCptZ+Padpt8TZumsVrcvIrJ30/xx+8VIvfhhHdNjAZHk3AlfVXK4UgZVNL
	 b32LgpGL4KsYxOy1v1vsgywFwmriGlsYIZtb9mPGuNq5m5ZaUNJLuAmzk38CG4dTFTMIb
	 6nrafHWx8t4vpD5xz+ikA2QVQfHF54ig9xhuRPgAfBWBZrx9ftLgIzSwfJIWvtO1ILd+b
	 v6LRTO6BDFLLB/ZuCUkckRmy5YQuLGgLQZ+41caUwBKuITKHawp0AnrURErowbXHvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6rzSpGT;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25848606A337
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25848606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6rzSpGT
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be6030c9fso3361836d50.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794456119; x=1795060919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2LLM4DBtKMrmpo5mqaQsURV/pMMXl4CIcJIhacgRMA=;
        b=p6rzSpGTWjDKZ5kW7CKjycwevukvA1AatisbmTOSXHIfaxwHXooaIOzxVqinLZoHUg
         Z/m0bvPwkvrTrngcSjB15O7QToMN/D+DfVedWOdvADX/uuVQgRsKiIXuL+8vzcV7QVL+
         w0qgkHsh7nrWVkhL4d5GOVs+Q5x6kufe48ag2l8iavzrGmDl/4lDupGl98UJ8NdP4IG+
         QC7lz2Rv3NhE9HJkX2bF3jlQsziOy1I4lMefS4AnJigxUwMwOSioDPApyvVEjACETMQN
         kQYfwX+EpT3iRr0HYViFCCzJYeKQiSbWnzOWpnLpFPSubuOkhjMrbMum6nmrfmMbS6n5
         Lacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456119; x=1795060919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2LLM4DBtKMrmpo5mqaQsURV/pMMXl4CIcJIhacgRMA=;
        b=l2c3ANbXLY3L+AQMSA7BvUi8SM4DTfaSp3JXcYGYoayOvz77FdMzlnGZvUdOf46WCI
         pSS11rh6esJb8JwQnEl5f8BYZQeLpu/XviLAQurwpjIr2ccXnXOEiXAFVA931+OQTbkI
         CEhxhRn7gSAJs/qzncOvu5tv1IKg4cZh/o5N94cqHwv+ynyPENfV5++xBkFS4DcpcIra
         k06PCgsS1T3btJilW1Dk22D8xWeJO9qPBHXmMNROquslfZdXEoemqEp7m6pENl9nZj/H
         AX0YEuCy/R/npkcqUZlDzwaOLEP7ecPrBv26kHhEbH+HWUePUU5JOZh4XN8JI8E1yISV
         H9zg==
X-Forwarded-Encrypted: i=1; AL+hErEB14mIDjVg3oJrNb3bSwsMJPuLiW3i5DfZzn9pHkB/4pq40lcrh0FF4yDXq4tQI8bz/8g8LFuA6GVvbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SzufPVkwtdpJGFNXwnydYidzt4KBBRYlM64QcgyIjIIR+irZp
	a0HFmYH2ZYgVIj+zj/d+fT34Pkd1OkZQk5SKXYw5zANEtKBmtoQZZAQNTQo/VUQ5sHnOBjgxJiI
	c2wde4bObFQ==
X-Gm-Gg: AYBFou3DLV8SgDvww8M+WZQ/ALNCIWaCAfLyrBCHWNIHE4vud49xGsvWFnSmKO0jOWv
	Bh3NLHYC1NKYMZm3F4CZKDEsCTzA24mTemG3egTaJyeM8PYH6enqSGgw7bnJDQy+xXCGJ9xW3S4
	HCmZPIDkGvUQZCIfTwRjHgEi6IbCoqGr7ihu/KoeX3BjeYiupjR5jQHUvI9A1HC97upqZckbb+m
	XqQLJF8BlMECeUWpn9WlNsQYtn617Po+jJG0v5COJp5d8wPpNDxPJQLmoVNQ5tyElQKtkfUaRs+
	hDCXSqicBb7ueLMHfQaFd4xqHkg+cWApcPZi2Nq9rDYkQ5T6peGINS7/hX72OQTE9V/LxOsZ1zg
	kZCh2FvcYyNUx4V+NKu/EXgazgOdYunkHlj5mpegn9/2CVjCbKlOggWqBj1U2+7rIVVlKZrFC43
	xHWrawufZRss7MDFkH+GK5jd8yfR6uEtXBIIlcupVr4OJ7FyF29womz3Ub6C29lQfasRU3XtAl2
	1akkO7wh6XH2+IuGs669cEDnyoAnoPyatYA2NzkFEJfWx3GewwLD/AnKgrKUiqqFGCMc+CCEUK8
	D8pJoIUegaoBhew/FMvRts9ofsXJPLqwVvEGsDquWuJr+A==
X-Received: by 2002:a05:690e:4196:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67c67c9274amr3017796d50.4.1794456119201;
        Wed, 11 Nov 2026 20:01:59 -0800 (PST)
Received: from myarch ([220.149.255.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589cf1fcsm6209654d50.13.2026.11.11.20.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:01:58 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: [PATCH RFC 1/1] ASoC: rt1320: Use the BIOS init values on LG gram 16Z95U
Date: Thu, 12 Nov 2026 13:01:43 +0900
Message-ID: <20261112040143.6945-2-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112040143.6945-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
 <20261112040143.6945-1-jaehoon1744@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

On the LG gram 16 (16Z95U, AMD ACP 7.2, SSID 1854:056c) the RT1320
speaker amplifier on SoundWire link 1 accepts the playback stream
without any error but stays completely silent with
rt1320_vc_blind_write[], even at 0 dB.

The BIOS describes a board specific "mipi-sdca-function-initialization-table"
for the SmartAmp function (SW23, function 4, 5627 writes). It follows
the same sequence as rt1320_vc_blind_write[] but differs in about 50
registers: clock setup (0xc5c2-0xc5d0), 0xc050-0xc063, 0xc582, 0xc60b,
0xc682, 0xdc20, 0xcd00, 0xcf02, 0xc900/0xc901, 0xce1b-0xce44,
0xd471/0xd479, the L/R mapping in 0x1000db15-0x1000db23 (swapped
compared to the driver) and the final 0xdb00-0xdb1b values.

Use that sequence on this machine, without the table's bulk areas
(0xe000-0xe7ff, 0x10007000-, 0x1000d000-, 0x2000xxxx). The MCU patch is
still loaded from linux-firmware at 0x3fc2bf83, and registers the table
does not touch but rt1320_vc_blind_write[] does are kept.

With this change the internal speakers work: normal music playback at
0 dB amplifier gain and 50% system volume, correct left/right, no
distortion or noticeable heating.

Not intended for merging as is: it changes ~50 registers at once and I
do not know which of them are actually required. DSP firmware / RAE
files are still not loaded on this machine.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: JaeHoon Kim <jaehoon1744@dankook.ac.kr>
---
 sound/soc/codecs/rt1320-sdw.c | 214 +++++++++++++++++++++++++++++++++-
 1 file changed, 210 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 42acb6c..14d07c6 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1805,15 +1805,221 @@ static void rt1320_load_dspfw_work(struct work_struct *work)
 	rt1320_dspfw_load_code(rt1320);
 }
 
+/*
+ * LG gram 16 16Z95U: the BIOS provides a board specific SDCA function
+ * initialization table for the RT1320 SmartAmp (SW23 AF04). This is that
+ * table without its bulk RAM/patch areas (0xe000-0xe7ff, 0x10007000-,
+ * 0x1000d000-, 0x2000xxxx); the MCU patch is still loaded from
+ * linux-firmware at 0x3fc2bf83 as in rt1320_vc_blind_write[]. Registers
+ * that the table does not touch but rt1320_vc_blind_write[] does are kept
+ * and marked "drv".
+ */
+static const struct reg_sequence rt1320_vc_lg_16z95u_blind_write[] = {
+	{ 0xc003, 0xe0 },
+	{ 0xe80a, 0x01 },
+	{ 0xc01b, 0xfc },
+	{ 0xc5c3, 0xf2 },
+	{ 0xc5c2, 0x00 },
+	{ 0xc5c6, 0x10 },
+	{ 0xc5c4, 0x12 },
+	{ 0xc5c8, 0x03 },
+	{ 0xc5d8, 0x0a },
+	{ 0xc5d0, 0x09 },
+	{ 0xc5d1, 0x89 },
+	{ 0xdc20, 0x30 },
+	{ 0xc582, 0x01 },
+	{ 0xc60b, 0xb1 },
+	{ 0xc682, 0x60 },
+	{ 0xc057, 0x51 },
+	{ 0xc054, 0x35 },
+	{ 0xc053, 0x55 },
+	{ 0xc052, 0x55 },
+	{ 0xc051, 0x13 },
+	{ 0xc050, 0x15 },
+	{ 0xc060, 0x99 },
+	{ 0xc061, 0x55 },
+	{ 0xc063, 0x55 },
+	{ 0xc065, 0xa5 },
+	{ 0xc06b, 0x0a },
+	{ 0xca05, 0xd6 },
+	{ 0xca07, 0x07 },
+	{ 0xca25, 0xd6 },
+	{ 0xca27, 0x07 },
+	{ 0xcd00, 0x05 },
+	{ 0xcf02, 0x0f },
+	{ 0xc604, 0x40 },
+	{ 0xc609, 0x40 },
+	{ 0xc046, 0xff },
+	{ 0xc045, 0xff },
+	{ 0xc044, 0xff },
+	{ 0xc043, 0xff },
+	{ 0xc042, 0xff },
+	{ 0xc041, 0x7f },
+	{ 0xc040, 0xff },
+	{ 0xcc10, 0x01 },
+	{ 0xc700, 0xf0 },
+	{ 0xc701, 0x13 },
+	{ 0xc901, 0x09 },
+	{ 0xc900, 0xd0 },
+	{ 0xce44, 0x1c },
+	{ 0xce1b, 0x88 },
+	{ 0xce31, 0x0d },
+	{ 0xce30, 0xae },
+	{ 0xce37, 0x0b },
+	{ 0xce36, 0xd2 },
+	{ 0xce39, 0x04 },
+	{ 0xce38, 0x80 },
+	{ 0xce3f, 0x00 },
+	{ 0xce3e, 0x00 },
+	{ 0xde03, 0x05 },
+	{ 0xc570, 0x08 },
+	{ 0xc086, 0x02 },
+	{ 0xc085, 0x7f },
+	{ 0xc084, 0x00 },
+	{ 0xc081, 0xfe },
+	{ 0xf084, 0x0f },
+	{ 0xf083, 0xff },
+	{ 0xf082, 0xff },
+	{ 0xf081, 0xff },
+	{ 0xf080, 0xff },
+	{ 0xe801, 0x01 },
+	{ 0xe802, 0xf8 },
+	{ 0xe803, 0xbe },
+	{ 0xc003, 0xc0 },
+	{ 0xd470, 0xec },
+	{ 0xd471, 0xba },
+	{ 0xd474, 0x11 },
+	{ 0xd475, 0x32 },
+	{ 0xd478, 0xff },
+	{ 0xd479, 0x40 },
+	{ 0xd47a, 0x10 },
+	{ 0xd47c, 0xff },	/* drv */
+	{ 0xc019, 0x10 },
+	{ 0xd487, 0x0b },
+	{ 0xd487, 0x3b },
+	{ 0xd486, 0xc3 },
+	{ 0xc598, 0x04 },	/* drv */
+	{ 0xd500, 0x00 },	/* drv */
+	{ 0xd500, 0x17 },	/* drv */
+	{ 0xd600, 0x01 },	/* drv */
+	{ 0xd601, 0x02 },	/* drv */
+	{ 0xd602, 0x03 },	/* drv */
+	{ 0xd603, 0x04 },	/* drv */
+	{ 0xd64c, 0x03 },	/* drv */
+	{ 0xd64d, 0x03 },	/* drv */
+	{ 0xd64e, 0x03 },	/* drv */
+	{ 0xd64f, 0x03 },	/* drv */
+	{ 0xd650, 0x03 },	/* drv */
+	{ 0xd651, 0x03 },	/* drv */
+	{ 0xd652, 0x03 },	/* drv */
+	{ 0xd610, 0x01 },	/* drv */
+	{ 0xd608, 0x03 },	/* drv */
+	{ 0xd609, 0x00 },	/* drv */
+	{ 0x3fc2bf83, 0x00 },
+	{ 0x3fc2bf82, 0x00 },
+	{ 0x3fc2bf81, 0x00 },
+	{ 0x3fc2bf80, 0x00 },
+	{ 0x3fc2bfc7, 0x00 },
+	{ 0x3fc2bfc6, 0x00 },
+	{ 0x3fc2bfc5, 0x00 },
+	{ 0x3fc2bfc4, 0x00 },
+	{ 0x3fc2bfc3, 0x00 },
+	{ 0x3fc2bfc2, 0x00 },
+	{ 0x3fc2bfc1, 0x00 },
+	{ 0x3fc2bfc0, 0x07 },
+	{ 0x1000cc46, 0x00 },
+	{ 0xd486, 0x43 },
+	{ 0x1000db00, 0x07 },
+	{ 0x1000db01, 0x00 },
+	{ 0x1000db02, 0x11 },
+	{ 0x1000db03, 0x00 },
+	{ 0x1000db04, 0x00 },
+	{ 0x1000db05, 0x82 },
+	{ 0x1000db06, 0x04 },
+	{ 0x1000db07, 0xf1 },
+	{ 0x1000db08, 0x00 },
+	{ 0x1000db09, 0x00 },
+	{ 0x1000db0a, 0x40 },
+	{ 0x1000db0b, 0x02 },
+	{ 0x1000db0c, 0xf2 },
+	{ 0x1000db0d, 0x00 },
+	{ 0x1000db0e, 0x00 },
+	{ 0x1000db0f, 0xe0 },
+	{ 0x1000db10, 0x00 },
+	{ 0x1000db11, 0x10 },
+	{ 0x1000db12, 0x00 },
+	{ 0x1000db13, 0x00 },
+	{ 0x1000db14, 0x45 },
+	{ 0x1000db15, 0x12 },
+	{ 0x1000db16, 0x09 },
+	{ 0x1000db17, 0x00 },
+	{ 0x1000db18, 0x00 },
+	{ 0x1000db19, 0x00 },
+	{ 0x1000db1a, 0x13 },
+	{ 0x1000db1b, 0x09 },
+	{ 0x1000db1c, 0x00 },
+	{ 0x1000db1d, 0x00 },
+	{ 0x1000db1e, 0x00 },
+	{ 0x1000db1f, 0x0d },
+	{ 0x1000db20, 0x01 },
+	{ 0x1000db21, 0x00 },
+	{ 0x1000db22, 0x00 },
+	{ 0x1000db23, 0xbf },
+	{ 0xd540, 0x21 },
+	{ 0xc5c3, 0xf2 },
+	{ 0xc5c8, 0x03 },
+	{ 0xd471, 0xba },
+	{ 0xdd0b, 0x0d },
+	{ 0xdd0a, 0xff },
+	{ 0xdd09, 0x0d },
+	{ 0xdd08, 0xff },
+	{ 0xdb03, 0xf0 },
+	{ 0xdb08, 0xe7 },
+	{ 0xdb09, 0x00 },
+	{ 0xdb19, 0x02 },
+	{ 0xdb02, 0x73 },
+	{ 0xdb01, 0x00 },
+	{ 0xdb04, 0x00 },
+	{ 0xdb07, 0x00 },
+	{ 0xdb00, 0x00 },
+	{ 0xdb05, 0x00 },
+	{ 0xdb06, 0x00 },
+	{ 0xdb1a, 0x00 },
+	{ 0xdb1b, 0x00 },
+	{ 0xc5f7, 0x22 },	/* drv */
+	{ 0xc5f6, 0x22 },	/* drv */
+	{ 0xd172, 0x2a },	/* drv */
+	{ 0xc5d6, 0x01 },	/* drv */
+};
+
+static const struct dmi_system_id rt1320_lg_16z95u_dmi[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
+		},
+	},
+	{}
+};
+
 static void rt1320_vc_preset(struct rt1320_sdw_priv *rt1320)
 {
 	struct sdw_slave *slave = rt1320->sdw_slave;
+	const struct reg_sequence *seq = rt1320_vc_blind_write;
+	unsigned int num = ARRAY_SIZE(rt1320_vc_blind_write);
 	unsigned int i, reg, val, delay, retry, tmp;
 
-	for (i = 0; i < ARRAY_SIZE(rt1320_vc_blind_write); i++) {
-		reg = rt1320_vc_blind_write[i].reg;
-		val = rt1320_vc_blind_write[i].def;
-		delay = rt1320_vc_blind_write[i].delay_us;
+	if (dmi_check_system(rt1320_lg_16z95u_dmi)) {
+		seq = rt1320_vc_lg_16z95u_blind_write;
+		num = ARRAY_SIZE(rt1320_vc_lg_16z95u_blind_write);
+		dev_info(&slave->dev, "%s: using LG 16Z95U init sequence (%u writes)\n",
+			 __func__, num);
+	}
+
+	for (i = 0; i < num; i++) {
+		reg = seq[i].reg;
+		val = seq[i].def;
+		delay = seq[i].delay_us;
 
 		if (reg == 0x3fc2bf83)
 			rt1320_load_mcu_patch(rt1320);
-- 
2.43.0

