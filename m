Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02254192D97
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422534; cv=none; b=ktlhA459OSCHoUjhHcx/Jj9DJaGDOFbqBHYbII/467+2RUvGSMWwkQn/UfA7k75aeN1y9waWcp4hJOeNm1v/xsZzsHjGdAiE9k47Tirgkad760FfrhazUDTtTE4P21KxmmKThwW9TioW3AJlH7vywIxOBfP+3zCN3T+mJJt0VKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422534; c=relaxed/simple;
	bh=yV/cohOAU0acqeKhYOF32vZAQd6gQ4bNwSd65qaYKwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRG5V71XilJ26bjukRJdA9YI9dsrAdd82FUPjOYYkG1iim8xyXVw3SKj8AeYycykq2wYGLr5kKHRNarW7nuclTttuzPDauu31HlcxKyuvs7VJR3lfDMqIazML2fOcAfoliSoNIGdHwhEp4lMS4zknwGWdSUyU2P3YH2lGfvE90w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com; spf=pass smtp.mailfrom=edburcher.com; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edburcher.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so1699944f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 12:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422530; x=1748027330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gC1ElHirDkCJ6liEZ8sz9vGoPFuVnpRtLcmauQftRiA=;
        b=Q5khGsrV0BB8wYFxUuNJX1QJyWddbx00iVE24UE/VjL2bx3R8OVyqGEt1dXz91J50b
         iRsen62p675gKjjnhrP/AEpMcdSkwcspin10XUeeFwCbme8AT1CwxNy7oRIrXWxXcjfy
         yrd+By6L/tRB7qKsV+H2UKic9o6yzZ4gZv9CO8RNmFZ8QDWQmjeitoDQc7CtbCZwoPdD
         F+QA4H8TDoA8fnCmctTEspZ6kZZS/0fRWO5bw69qG15G5mn0ImbqaqoS1wmXFozjge4X
         RGjwpDkMcLiNP4TUS3wi9W8oKfbcLoH1zkE05KxvGgL7ATE84SGcVpLYCiHPz3zDRqXj
         49WA==
X-Forwarded-Encrypted: i=1; AJvYcCWVizi+2jcTgKesqgIuMoVCdjdDN9zFbqur/pqXvLk3QWXgFRIDyQQi+X3nhRHxlrK6amnQSFesPFbjrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGWyLm/LKKFpqW5EA/meQ1HKJpN07241ps2QfG7BqBM6ZRqxn
	q+ksunKVmYFqZbu39cAge/3qy3U1Y7E0tHB86B32lnNuGSXAJ8RDlca5IuGG2AiX5FA=
X-Gm-Gg: ASbGncvl+YLekj6s189FA2VsgaWe18tVATUrsz4AGE0jXl9FEAre6Zu+oHQkBGWAjX+
	eDWkWEKpmV2/mxOPOMCktz0UpDltyh3yrpv7pv3RfRGP5cl29BJo82CBTWBIxsoshZ7vpQVH3QQ
	miodnpMA6EHUnqavg4tSKJqUHXyVpD6uP3fGlgWRRivCntQVHxUiXyqPdLNOiC2DHymvQn2rxzW
	HK+K8P7ja3YGpXdlONOFPxlroYf6iyMUl35w50wEts96s8OkxNt6vdqAcPrQqFy4iVqoltFRjoh
	1F1yzgZ3AEy4BMyKDhDPIgWMDWcrd4lytuTYKLWly56kSWMOEoA=
X-Google-Smtp-Source: AGHT+IF3QZV2RSZp24to1iLOxhAd/2l/ZHFLD+Z3sXNMiV+8G0JDX8HibsUKr1MPOZIHsskQFLGUGw==
X-Received: by 2002:a05:6000:1aca:b0:3a3:4b8a:9752 with SMTP id ffacd0b85a97d-3a35c83e8d6mr4677816f8f.21.1747422530183;
        Fri, 16 May 2025 12:08:50 -0700 (PDT)
Received: from electron.local ([188.74.119.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88a34sm3706855f8f.70.2025.05.16.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:08:49 -0700 (PDT)
From: Ed Burcher <git@edburcher.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: git@edburcher.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/1] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
Date: Fri, 16 May 2025 20:08:32 +0100
Message-ID: <20250516190832.35128-2-git@edburcher.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250516190832.35128-1-git@edburcher.com>
References: <20250516190832.35128-1-git@edburcher.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Yoga Pro 7 (gen 10) with Realtek ALC3306 and combined CS35L56
amplifiers need quirk ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN to
enable bass
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a2b09e4a7d5..4d719dddf02f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11300,6 +11300,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
+	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TAS2781_I2C),
-- 
2.48.1

