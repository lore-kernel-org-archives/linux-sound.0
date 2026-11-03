Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713179;
	b=LkzmMURBAZFh02d7Gsu3VXpVdgYBjjc650c6S/s9BwtPmnZ+/h+Hsl3QieH5v2IrXeRM
	 CawukPEot4bhwGRJrOXH/0nzqtbSrKYWMkGgPAr9gzEt7xk8wPjpUgd+Tqv+ZYYAARSUj
	 tchZCsFH4jtqKh3bzV+CD5PVPi5lgMc3MKovsedWKnx6cmkdoHFLvuRguaYQCpKLFE56Q
	 ti5zUuLrLVCuXIioXT4gSPhWbAkbt4LcAg2Q8SvrDzJjGXwI+C9XxOx5cucdWwsBFku3L
	 vaGa8iQEHW4C72JCHWi6FUxVOzMcH/9X/vuARgCtCvzTzotvfk6N0Xsb+Z9W9FIpBXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
	b=YFp+4XTJSK9kwbXtOO6klSShdHDt6Wbs0ar762RW4RWkNO0AS6ZAnmr6/VVSV7Zln46J
	 LKTDYdFqHSzjBUofSTjfBU0xOE9pwuykoUdyZ7WXrL85dwo/am2MbkzW+VnxJVlzkgAcj
	 x1hSxWXmVVvty1LNwDxOS/1R5WKvik9u0OWZs7Tl6pQ95tfc5RuGhUL2HvHt5Z6/FK5L6
	 aisUxqFq71NVZG8t6u86nIdxk0nRRJtPCyZ6UOKib7VKWNaVXZ0VwNCTu1YarTyl/mvXY
	 V6lKd4CXID4PH5C/GQosS3+nEpIZyoOzD2hqNonRHSFGx6+AlohUtlF0m8aczVBpWUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCXvPlcq;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE5606A330
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BE5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCXvPlcq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso37312995e9.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713177; x=1794317977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=MCXvPlcqdVs7tTpKypMadM0mmxEQaagyVJ/B+2LiOkKeFDrHSiXXO2Mb0CD9yzFBMk
         76PpMH3k45jbVFkZow4UasPjMK31Q4IScz85juHliolZdaW3KpLFTXGtCgDO9k78Q7Xy
         Aa+jw/50DXZ7HsmfstIAvPAYZjooV112Tc2IeAHYQZ33E3qdVTGXgrayRPxiDad49DwZ
         OebleavsRlHAuVH1mGTsB4FH3SdtXmN5SygEFibHQS1P2R/MzDuoWSX3RcdhjDqgPwuf
         bfA3HdEaTNTCBPashow2hlvVhw8G/cHSUnA6o7wrBeOrrTQFgLpACDo+JYYYC4Sw8+rb
         sOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713177; x=1794317977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=hWPxx+LyJ2MtEfDMpjjNtZHQURhEgRdv+eqwDwcsMKxkHdoazwy9U/qNKO0kIDXDhK
         r4v6Y8MItPK8HjR5QM8hhE0BUyVw8SZt725jsfRxnLMF+AizWW0tITtncN+dicoL0oKh
         /8xwuW+1LK6i+X+0es4CSZ44zVaOlvrHnNMbh4St9uXhl10q9UZM7fg8Asc9lrJ+6fSO
         OrVV/FzKQLtbKVXf6+ld+GDStC4nZkNQpC8rl18YTsw0kAJy4nw2fwqSGx3voVJouEqx
         q6X+r6lLZJkyjLLOVN37zD9LHMO0DP/4gEzTBc52P5cigCYshGEBAog2yxBwTUVUjlmE
         hymA==
X-Forwarded-Encrypted: i=1; AKwUvBwWwHo/SC5VaSkk6kHypPuCs0jxX7f0XO3lJ9tfUEOEUa7EbpURMxefD06FyEZXen5k+2+xKqn0dvntXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8QlKMA/Ig4nXm/iBgtuRBsHt7I8MJrtOMsCPak8TIDGd/qavkj
	cLU8UnHNiTGWRfaaxTNSUPbSGZu+KtJXZszrSgN3S+4srFBY0YASk8kC
X-Gm-Gg: AYBFou2u9rTKDMF3OlfWPQ1SxKngvT1JUCFD+6zJ7P1DP0Ur/0TlOhQlVFJGMNHG97p
	6sspDqB74L16l/BMfphTyJweB/RWsNmpAsEQhm26lwlw9ErTdfd8HFKtVfYKUV3ywn3DzJMJxIu
	dL3vaLxltXazf72AkWoRJkcR+JTQGErcINCNo9OXLxMcAzexTwZq95H+v5J8rKilvrr+q5oZW4D
	M3B9BXZzPMcasP/s7i4squSsJ16FjaqOZGlnHnsciM6Zk3fYFK3ZgwcCZHSZ0U+vWc3h1iUgayz
	hfj1iPWfDPShPLsq0Ev/NBJ9y4UFqpU/yxmF7aclImvFWsOA3KAnTNAkwRzUzcUWmTNoLWGfzBP
	ENGL0599+fa3BI084o/WBynxqFm7S0fZ9FV9C8LVWWIIkKFj38aibck7VLWrq3BGLT32/Ap3/Kd
	nnN4HxhnCgcxiJwlrpjXGzc6pLPeTBcoYbVjh+9toSOMfgQhsrRsuVZqt+Qgc5dej5ZhKjAsH0K
	IurT7IXeD9qUyQTuDIGvB6qh+8HxA7sZ2Ebd2MbbHWsg7tLevyoZ4NBQdd9MK0lTxxWf5wTrRR9
	g2MduPj0rP22pGiU6YfByqmv0leOViZHkIXpL0INhojF0NkTclDVBstdzw0Uxqix8GzVIg8mxeI
	FnYJHaEHk/WEEdQqIHwwaD/eFEWLS97LgVgOh8Aa474Qibw==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr319276755e9.17.1793713176492;
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm24174999f8f.24.2026.11.03.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Tue,  3 Nov 2026 14:39:35 +0100
Message-ID: <20261103133935.2892210-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
feed the inverted left output to the right one and the inverted right
output to the left one ("Left HPOUT Negative To Right HPOUT Mute" and
the reverse in the A23 and A33 user manuals and the V3s datasheet; 0 =
mute, the reset value). The driver defines them but nothing can set
them.

They are needed when a mono speaker amplifier is bridged across HPL and
HPR, as on the PocketGo S30 (A33): with the same signal on both outputs
the speaker gets almost nothing. With a mono mix on both DACs and the
inverted left added to the right output, HPL - HPR carries the signal.

Expose them as one enum, "Off", "Left to Right" or "Right to Left", so
that the two outputs are never fed with each other at the same time. It
defaults to "Off" (both muted), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, no warnings. On a PocketGo S30
  (A33, mono speaker amplifier bridged across HPL and HPR), first with
  the bits written by hand while a 600 Hz tone played (same tone on both
  channels, AIF1 DA0 route "Mix Mono"): with PAEN_HP_CTRL = 0xf4 (HPCOM
  driven, no inversion) the speaker is much quieter than with 0xf6
  (bit 1 set) or 0xf5 (bit 0 set, the other output muted).
  Then on 7.3.1 with this patch, same tone through PipeWire: "Headphone
  Inversion Playback Route" = "Left to Right" sets bit 1 (0xf4 -> 0xf6)
  and the speaker is clearly louder than with "Off"; "Right to Left"
  sets bit 0 (0xf5).
- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..7188b498fb08 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -314,6 +314,25 @@ static const struct snd_soc_dapm_route sun8i_codec_mixer_routes[] = {
 
 /* headphone specific controls, widgets, and routes */
 static const DECLARE_TLV_DB_SCALE(sun8i_codec_hp_vol_scale, -6300, 100, 1);
+
+/* For a speaker bridged across HPL and HPR: one direction at a time */
+static const char * const sun8i_codec_hp_inv_enum_text[] = {
+	"Off", "Left to Right", "Right to Left",
+};
+
+static const unsigned int sun8i_codec_hp_inv_enum_values[] = {
+	0,
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE),
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(sun8i_codec_hp_inv_enum,
+				  SUN8I_ADDA_PAEN_HP_CTRL, 0,
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE) |
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+				  sun8i_codec_hp_inv_enum_text,
+				  sun8i_codec_hp_inv_enum_values);
+
 static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 	SOC_SINGLE_TLV("Headphone Playback Volume",
 		       SUN8I_ADDA_HP_VOLC,
@@ -323,6 +342,8 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	SOC_ENUM("Headphone Inversion Playback Route",
+		 sun8i_codec_hp_inv_enum),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: aae83f3931bc3a5497bcc8351b5f954ad7ac895c
-- 
2.43.0

