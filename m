Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC391427A
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 01:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056579; cv=none; b=dtbTDkH7GBHS1ufXZs7Z7EOVka2wpRNAgEhLlIM70WzeWfM2y1qACKAfnH8qDJFlb1ePlBpGQCk78RiRwFdvyjzGDMw4xTyWxEOIUzd2g1+1tFadh9MaRr/s7h8BY8hC6NTmlOFcTd4zHo+Mpi8FTSPZp+CiXq3qtD3+X9DLLFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056579; c=relaxed/simple;
	bh=dqH9cDlBuMXBoZ3HqMA68EZSucgLQFDS0EJW9TLzHpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGRZk3w+xLtknm9E6P+3dyfVVpTAf3kJs61fY1T9GraY7SO3rEzb81ooQePpwX3zqEsvxCQkfm0R1G5Ml/KPm55mbZkwLha8pue0QBgRum1qKR2NFqtOi1xsvDJHRioFtEUem5hjQjX5p6beFlSCZjtKz5wvDYU1hF3Z8H94J8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQYlERpf; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQYlERpf"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-137335bc3caso7885161c88.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781056578; x=1781661378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7CKpOtIEJX6VF9+gm1XQKFtxQTKoIy2N2bjbhGxBG8=;
        b=RQYlERpf4qksD1ESWcxbYBF3aOEF75gcm9SXY/5DGakC/kPPEROLder8ZISKvDDczB
         fhO/dEQ4fz7P9lEjisn1wCqBUeiPS5mMjz6qInyyA1K3VH6onnxTPgnmSbbDVPW57ayk
         g/2R1oz/DVrjRpX+shWB7cW1PtMJV+7cbu11fUu7XBReVaS8924wm8avu0lf6MNI5hBY
         Dv/L3ACTY/Bg/c4VmMzWH73PXb+WC+oGDQrs3X9yE8JCQhfFa/J50oEPHg6IYW/Gqi7A
         HrfOnoMwSIDDQcf38fqneUpgsCKPpPdFaHmWcCZojI2HbF2HvDoI8vlETMb6jG49N1zn
         qpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781056578; x=1781661378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7CKpOtIEJX6VF9+gm1XQKFtxQTKoIy2N2bjbhGxBG8=;
        b=iJ5uqcz+u2k+VA+NSz5UV0QBn9jZhaHfto8vuIinYZWLjLi+oZXddJ4dTx2wNlcUrc
         61BheX3Je0lzYXsS+LRakzQR+IJ1EfC+ebcT2i9VGGL9PwKcpUfdG40DViAU5Gn9Iw2O
         83wDDxBH/NdqObG62tErneN2FiPDUfza8dJnWLdMmun5tH3MmSctdT3Bt5oP7N5GP1JM
         fGiPtcu7fu5ZgrEpgfnc4RlZQ7KhyS/yN8ISyjApq2JYDKCaMfil61D3cNJh+f9BQFC2
         a98Cgkbidwjrj++v5r/JpCOwrMOHzl33rAvh6XkP1nm0uey98tb6RgIpIJ0VBwkoMDGS
         irpg==
X-Gm-Message-State: AOJu0YyqguZoP/pG2O3yylsVAkgYj798SvZ44MWiK0MqgknAgo3vvwdC
	MDta9zgiqxQ4hVbsfG4VdZ7XVm19HfLz9L1BG/pDLT0paojxsi0ZihsCJi1/WUiS
X-Gm-Gg: Acq92OHeybz3eXiEJTknH/gK5HcuuRfofzmOdRP89MxlghQBZQpqu4yv/Y0wqYCcsIy
	8XMy5aQF7H3x1TCYMQ3/lzIT4JRr9jCvZVv8f4IsWcF6NaQdmWMWn4SVpmZ4C1qAKKKdtfa3sXw
	alxxglkHeoQLdPLbDbw4MdB4KJuOLxko9YLjL57+PZGDeRWfLSCWnZJbQ993bgIt23JrX1c293x
	Z81dIOKcwq60ExBSDAXw66afx/k0X2V+nh31SrG8Rc4PNeOpKjSwO5ifPLd3/rghhHFktQ71XHy
	rOod4SMndnamgxq7OsmEI7S6UR0M6BgrguqBuRA1tDYoX3vFnDl1FNl/NtXwvqchMKPBT0DwceA
	L3kyOm93uNFueWbICNst8ZrVVqG8RLtL6Zbf0MEka/mNslERR9RTMWqA08JDYTUOSTUHPbEsIq/
	sI4ODDpnjSsgBxkdlWYiGGtLBPCB8vnOvvvDhmowTfYPxSQVrCkmAs7s3IV0gDq6xjZIi43EIUu
	GYpRfa4szRi91SZaxMkIwZiEwMDcyjfVrSx3a2/dUknVnTP/OZdNyID0sUJtS+L9vo4r5XYQaFv
	cko2Duin15YfkPE6ciDKg6nxVXUm
X-Received: by 2002:a05:7022:e997:b0:138:3742:fe5d with SMTP id a92af1059eb24-1383742ff6fmr1158962c88.18.1781056577445;
        Tue, 09 Jun 2026 18:56:17 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f53f06c4sm16508829c88.0.2026.06.09.18.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:56:16 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] ALSA: docs: remove references to removed CONFIG_SND_HDA_POWER_SAVE
Date: Tue,  9 Jun 2026 18:56:09 -0700
Message-ID: <20260610015614.41530-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CONFIG_SND_HDA_POWER_SAVE option was removed in commit 83012a7ccbb9
("ALSA: hda - Clean up CONFIG_SND_HDA_POWER_SAVE"), but references to
it remained in documentation. Remove them.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/sound/designs/powersave.rst | 5 +++--
 Documentation/sound/hd-audio/notes.rst    | 3 ---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/designs/powersave.rst b/Documentation/sound/designs/powersave.rst
index ca7d1e838b4d..4b9d6d0b0d98 100644
--- a/Documentation/sound/designs/powersave.rst
+++ b/Documentation/sound/designs/powersave.rst
@@ -3,8 +3,9 @@ Notes on Power-Saving Mode
 ==========================
 
 AC97 and HD-audio drivers have the automatic power-saving mode.
-This feature is enabled via Kconfig ``CONFIG_SND_AC97_POWER_SAVE``
-and ``CONFIG_SND_HDA_POWER_SAVE`` options, respectively.
+For HD-audio devices, this feature is enabled if ``CONFIG_PM`` is
+enabled. For AC97 devices, it is enabled via the Kconfig
+``CONFIG_SND_AC97_POWER_SAVE`` option.
 
 With the automatic power-saving, the driver turns off the codec power
 appropriately when no operation is required.  When no applications use
diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index 6993bfa159b4..1412a8eabfa8 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -341,9 +341,6 @@ hwdep option above.  When enabled, you'll have some sysfs files under
 the corresponding hwdep directory.  See "HD-audio reconfiguration"
 section below.
 
-``CONFIG_SND_HDA_POWER_SAVE`` option enables the power-saving feature.
-See "Power-saving" section below.
-
 
 Codec Proc-File
 ---------------
-- 
2.43.0

