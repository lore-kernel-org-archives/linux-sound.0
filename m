Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D6314B93
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 23:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770765237; cv=none; b=UWj7hdA61rz/HUxQcQ9S+rldSw4NwEPvgtMiEQjTRr06Cs570byyTY2i+vB1bgVCHo4hVOr1Xm2TKxkx5yX7F2ymjdrrVO9bPZvL59DvWfCUp/FVPs8KfMeVYeA3TXsdTamAuyJUMQWr1/iO4HxNwFHuhTuFLUXSiSeFuUZsSNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770765237; c=relaxed/simple;
	bh=qMqaPEKoWyjXmYfAH/4rFVHq2BLU9FWeOfW6jUzTfto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+h36pJok5pTsdJN4iT4O9vz4gubQLp1mzwDoSUsjQTfwcGt3CRfctm02R0Ov+5+Hgx9oWDyfd7wg4HohzxN56LvUdH03hx6EwGUuCROvIbTt8mqzoN06n8qf2Act1F5OZgjS71eSLvSC3ZOrublSmLY5OmXtDYiS+v3x+rlpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3jtm16p; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3jtm16p"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3883706f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 15:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770765234; x=1771370034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bD4A8iLkPT86OVNtKue5n8u7ZlVzU2MVeKWEyFIN18=;
        b=J3jtm16pugWt+krb61JLBFjfYJZDTVqfPSyBoOEWtWTKMN78KAb628+5T0pe5RgN4J
         Y9LmkeYMtQrWW8tJlAVDbrlKgF1QtVMahKruvugR8TrO8rkcGoLIxHD0yNxDa+4pDlLH
         +voU/Psy9hh5uSU+cVDZh04Bim0SmtUhybz7KOcqSVxyN+0YgfEmIaLmaxPMnrdXNfnR
         EQdD5dPqss2H+3gC684Yn8r3N6RDaP157DP4i7blRt66CAgzhaRJQE9XVbBK2X5eGj2t
         urKLvysB0mnjpDxTrqm181sCO/6Jmp3NCx+nNLhTVRNc1Q1BJuMRi619O84Z0D3niWef
         R4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770765234; x=1771370034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bD4A8iLkPT86OVNtKue5n8u7ZlVzU2MVeKWEyFIN18=;
        b=HUoOAQ0FkLv89WCLgcYEvVxX69r8KKOIo31sH8e5jVPGJPmtSuZyodVSCNv6YyUGu5
         gv86TAYteCKuCH8OrVEGNUWXoDYrKj5ZsdmMZBwMxh9xD2oBOBSMYD3qWiA+huM/nUnO
         O1TW6ElxfMgmAQ91Dx9aIG4QzyuctPsyDaHrzY+g90nJpC+K5E1FsVN6/w+goVCXKQcO
         xI/iG3TDH1p8T5VxAObcIKHwQ9CEkWKfIah/Ss6tKBEdT3LdgRoH2CJJN/l99T7FSsjD
         SHM2sYH+DVkYEEaNsmYInklF/+kETKM6WY3KOF7H6WJso+iAJPTWUyvmKOvHlyg2vL3P
         5bHw==
X-Gm-Message-State: AOJu0YzMC74UdXnzDRskTIFXNm85APppJmwcNXkde5Od+awG2ZpYxS6H
	V1By4ECNkeosJKsrWbwnlLlFi/CxPu7CaSMP2Uk+n3O5HX8lLwRTF3ysrD0JarBJxPA=
X-Gm-Gg: AZuq6aKcr5hHPiwVLWF/ie2N1HaQyWpFw3pt2pLILzaCQXhx0LTFUILXdt0hFdiNYpo
	rmMTZ7mK2OOC7XwZyG6hLBaNs9CV6RfhNOoTuhZgz7MjT5YN9daarq8s3bf5/F2U3W/hlzEG4ZS
	ik2uQKMngF74SM7U/Zsbss2nEUDeH2FKkEV+uCELP8oEYuyujbrGV9V8ifEFo4PqA29VMU/eg3d
	XKvxrSMAQp2OcrOaTozFbK74dZSnSwjM71C4qQ+Achz5nAaJAz/J/3foi4KDBGr/694hiILjnlf
	6J87Io6bilRRMNs6WPVMIgDQGMBZOMeVbzvJJ/u7m6WI9xuFf/XWqvEWRglDHZ7UOpnz8hsHqSz
	xh+v0omerqRTHPBELnwU7tgTdsRe4xFbUOOL5ok6QEFNOMlD+MTwAEQzM1tgbDEfPSddmAW+aHn
	yev6g4lvJR7+ImlxVDjwdvmEtecrwCj4XZsR7nZkYkRvtvKzci+XCGQtMxYbNU7RGVy7h15JfZi
	8wxXqAM
X-Received: by 2002:a05:6000:230c:b0:435:9d70:f2a2 with SMTP id ffacd0b85a97d-4378455b876mr12695f8f.25.1770765233786;
        Tue, 10 Feb 2026 15:13:53 -0800 (PST)
Received: from lewis-s360.localdomain (static-193-237-220-23.vodafonexdsl.co.uk. [193.237.220.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e39c6asm262034f8f.28.2026.02.10.15.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 15:13:52 -0800 (PST)
From: Lewis Mason <mason8110@gmail.com>
X-Google-Original-From: Lewis Mason <lewis@ocuru.co.uk>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	stable@vger.kernel.org,
	Lewis Mason <lewis@ocuru.co.uk>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360 (NP965QFG)
Date: Tue, 10 Feb 2026 23:13:37 +0000
Message-ID: <20260210231337.7265-1-lewis@ocuru.co.uk>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung Galaxy Book3 Pro 360 NP965QFG (subsystem ID 0x144d:0xc1cb)
uses the same Realtek ALC298 codec and amplifier configuration as the
NP960QFG (0x144d:0xc1ca). Apply the same ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS
fixup to enable the internal speakers.

Cc: stable@vger.kernel.org
Signed-off-by: Lewis Mason <lewis@ocuru.co.uk>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 80f0be13b..1a98ad9b1 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7318,6 +7318,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XEE)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
+	SND_PCI_QUIRK(0x144d, 0xc1cb, "Samsung Galaxy Book3 Pro 360 (NP965QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
-- 
2.43.0

