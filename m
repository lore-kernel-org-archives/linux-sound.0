Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE72746A
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058612; cv=none; b=n6XU1La/IuBFvZQJGcN/Jgsh89UPNmieB4L4NdIQq5Oa1E8X8Th5uIcYL4h+44RDcuAZYVKkRysUi0y2VgASGT/rPJoyyjwOZeIMVMOsDes7xvty6fuMTkzqnubwQXXxiSDkesoRa84rWtt5CXLW4Xwf+QELXTDAWfSH5ACHKpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058612; c=relaxed/simple;
	bh=uAp1zq4UAm0IYO+ZwtgxU7fAim3x3WLMLbQw6dxNAL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xvb/2D3xF5hnA3ZLmJL8cFsVECGlPZEHG6m/rWOSrZIUxdVb4bOS1lhzZp8geLszvb71ZUkEktnal4Qt9MMNeYrsaBz62WYPwr6RO2iNwNxYlVcc3/6e6+djIFmkjqCxkOTL1ERgKKO/PxZ0vTdi1y4t+EOwfmoheqIwiqQ2FB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I599fcyr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I599fcyr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4710022571cso48164105e9.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 07:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761058609; x=1761663409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=106EewX3MuqIthpbxs+PZyeQE4B4CUuPh+OcyVnwBiQ=;
        b=I599fcyrqd682HBtMOsVDub/pso0XtG8adpFRpt3l0wNYjJx29MQe/dcoFrY1f8XSQ
         /qRyPWlQtnTAo+egC2Ftc02XN/xLwVYjdKxQ30EK6i7D3KTqRYOmAZ80N8Jz6y60lxOh
         9pHXrdWOYaufJxeqUzLkdxWvQWtcI2682Hau5j4TBGxQXS3kUokV/tfG+zBZ58Njh8gW
         suez268kQevja+8jlcBpHMZ0fDCq4ei12s9i4iQnswyt6T9HS9aK92zvGsNXADDFyZTc
         dSYlds+N+jQz/l7s442DQ0Icfz/QYyxBSDcwiI7zrsXhd4jl7RhQqP0CMnsfTSHwPbRj
         8J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058609; x=1761663409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=106EewX3MuqIthpbxs+PZyeQE4B4CUuPh+OcyVnwBiQ=;
        b=LcmgoDhyRdPCpt+p5BeizMUcqvuxuWSvN4UPdRXhfrhtyBFlJlSrmMGgzUuIV2pd+0
         jiq4OgCJ5G3X92w1QLUZpFvkrTqTt/wyALckuQ4CjvScWebBSedbZnlOaD2guOIPCy9W
         56lnjmAiT8lGCqo7FSdYMlh5Hq4wT/SePhPfaa1xaflekpb7cwx0J/Ommjva6LAkiSmH
         YNfZcySV6R/if1PJhWYWloVJTDOT6SVWW0GnlQOPMw7pWXcvXRi/3sQbxQ0awWxtIGK2
         TUOgS3rd9SmnU6lscaSWEGDvdQpXYz30GN2HMiVo3X1uvFmOD6knsL9YGKESaSj7gXj5
         CBbw==
X-Forwarded-Encrypted: i=1; AJvYcCU98zSZtXW7nfwwSArpRDguE3vRASiDkOl2Xu1kSLG0aSHPf/FyyFCUFGkk4izqWrMt522jsjfCWH/WKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnq4kML44OCb2SaXmgffzS71uJWC3+UHFeymEoIDfMzFZVLk3n
	7Dk3uG1NYgWYg3GyZmR1iQhghg1wQxY4K2wHMz1Au8pqYF6Cd5frAZmFQO84eOAc
X-Gm-Gg: ASbGncve3OxnS/9KpUeLNEjpGNxp11ZDapiwmzMsMGPu+VkiCe+tVAtjBIhuiD0llu2
	nOp5WFUH6JIwlGDfQKwScw39Q+jVBp3j8Ff1VcTZULsV+QH9U3BPxt8wMbGbBSgKcMfuEzPtGZZ
	MXmsKHDY9/c611yqNl8Z9PMGMrbsqTDKI2m8vJaZ1ZENbDbQGiQ66hWt/hrNx/61ocfgo6y89JA
	fU+GFeYGOxqutnrk2QPjRHmqWtlhTs8WA+yGvDCCbLOogNlgO/ofkfZ/O5YvTvvOLQDuO2mFl8T
	91h73BkynfO7VWPsn806UFipcbiO4NKd0osLetaVkVrIsqnqyT8OCEd3C3FvtVWtkosV5+/s76F
	LkoN3+J2fwBOGDUZ5Gk0A5eV3Y/eOEwm+s0kFj0GpYoz3RApIg5rEacgQa2alWh8IfXOHzgJy2D
	TduT4J9jvPBNx+p4YzpVcCA+Vk99SIy2mmmnnwahHWBBYyEGwZLGPhUg==
X-Google-Smtp-Source: AGHT+IFmyrt+yKbKAsm1NCuC/Lpqyel7Z5uagFacgTNFRh60AlS6pzhlKeVcjlECoFfiqFBDYhOitg==
X-Received: by 2002:a05:600c:3494:b0:46e:4744:add7 with SMTP id 5b1f17b1804b1-47117870715mr142897385e9.7.1761058608698;
        Tue, 21 Oct 2025 07:56:48 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711442d9e8sm286879965e9.7.2025.10.21.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:56:48 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 3/3] ASoC: max98090/91: added DAPM widget for digital output for max98091
Date: Tue, 21 Oct 2025 16:56:11 +0200
Message-Id: <20251021145611.1750689-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added DAPM widget for digital output path from codec to the
CPU DAI (capture) for secondary digital mic. "AIFOUT2L" is the
left audio channel output and "AIFOUT2R" is the right audio
channel output, both belonging to the stream "HiFi Capture".
Stream index given as 2 and 3 respectively, as 0 and 1 belongs
to "AIFOUTL" and "AIFOUTR" of the primary digital mic. Now
with this commit the total channels increase to 4, so changing
the ".channels_max" for ".capture" to 4 accordingly in the
"struct snd_soc_dai_driver max98090_dai". This will work
for max98090 and max98091 both because in case of max98090
only 1 or 2 channels could be used and in case of max98091
maximum 4 channels could be used. Both the cases get satisfied with
".channels_max" as 4.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>

---
 sound/soc/codecs/max98090.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 5aff5a459a43..03cc6e0fc88d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1241,6 +1241,11 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
 			 SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("DMIC34_HPF", M98090_REG_FILTER_CONFIG,
 		M98090_FLT_DMIC34HPF_SHIFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_AIF_OUT("AIFOUT2L", "HiFi Capture", 2,
+		SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIFOUT2R", "HiFi Capture", 3,
+		SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
@@ -2371,7 +2376,7 @@ static struct snd_soc_dai_driver max98090_dai = {
 	.capture = {
 		.stream_name = "HiFi Capture",
 		.channels_min = 1,
-		.channels_max = 2,
+		.channels_max = 4,
 		.rates = MAX98090_RATES,
 		.formats = MAX98090_FORMATS,
 	},
-- 
2.30.5

