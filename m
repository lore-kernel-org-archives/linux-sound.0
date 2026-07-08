Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E24F390C85
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510602; cv=none; b=nPP5npaQGvQCKO4MOi7G16OJqD2xbGgUZMK1Gl6dE8r4pqOJzo56L1s+3srWaxVThsd4gkqxBg5TqZYtbqkTUolS90XGL0DSgaOvo5p7kuhoja/ZKnX4RqBLn7lNfCnYZ6qPIk5g5J8Z/ryeDsLwFqtVJJZzVLnFyF0rWOqXfxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510602; c=relaxed/simple;
	bh=IbjpZOam2hI9dpzZIJY7qG5MjnJ8WSt8d2P/o3d7CJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7QQHMPu+AISBTZEIxcJq5gBHd364SOQJiVJEur3/ApnHeyFn1EYLeJOlm2d1Sx6eJOYti3tkpItPhiRXh1+u/yBCuUdLvTl8YwDdcAGUlyXflYRcJ8vMWdjSFE31y7tC+umqR3YNy3A7q+1YG2XPHx+PWnkVuMUJd0CQOiuhHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRaOD5E+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRaOD5E+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so5524155ad.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 04:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510601; x=1784115401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZvxbMgMRY8vlx4bL3xwkM6A6vN75hNfiS9LW8iggcI=;
        b=iRaOD5E+dyQxc73OOD+r0RsHv5eDSOUjn+diwr9WzaFCHhsGcsg+DiCyEKDwEeBp31
         GWru5FsNa6SdNegBS58jMTjGCbPXuf4ocF7TLF5fiKcpG/BqCnF/dyEJAOlpuQblvzBY
         145eN5MSaCiEp3hdBMNSo9QMRLo0Hhn557ZpMsHyx1j602r1HhARerOiSevZpceyaCc6
         1KngxWoN3yk5VNSdex4pQxgd/E8HnNBKY57W+y2pE4q32wh2oyiYd+r4MIJyJsOk9bca
         APSAJkWB/DXbTvh1Ap7iCFKwPXxnshDY9HjOQ4Mg2IwdnVYoKaLQH5CZDN1r+VahzCAA
         gChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510601; x=1784115401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZvxbMgMRY8vlx4bL3xwkM6A6vN75hNfiS9LW8iggcI=;
        b=ec6CP0i31bDhg7j5kwpAelULDoA8dJHQG0FEE8h8CYhOjM5AUIOSqTJMSx6ZQpp6r7
         FceNH0rcDVVH32fdHeVymn6xNg83gHLk2vFsvUAbHnQseiQt/ZFBJPxz2O3YSUQofFZs
         FOKY3Gf8MNY7AKIMNm5gEdKrlNtEwJavjyfb3HAcF6VHrjPZzSEy+w3vlKgeqlash75R
         T9S+8VQTb3LfUX9vlRxMA1VobowTNwq2l0puCxU8nb3J/S/ubjPGoX48V11W7Tk5Pv+G
         DiUUXb79xEKLNUIy5VacFYpTmT0SLYhfy6oPRMxKgMoeId5oiL4/Odwi6O15qkVx9ldU
         GRPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXv5v9GleQeMpeL7FQRNBwBc0AcviUQSFmq+0neB9kRKRdQRNKknNkD59HvMjFtbIyYmqsy4UsfLQokQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDgT+bfSa7L5yfP/4+XPlMjW252OtIQfFQIWxMpGkYrBefa3ah
	nuNgizW0JalIcioIlPSn4PlHSoiUFvFJlbvgL9nCDrzQFl4XwTERV08T6Z/TO0DunlBCFw==
X-Gm-Gg: AfdE7cnjkWUI6xslEH9YScqNOa6yjd96YBH6S266nxGtHhvJbrFapQi/mg30peMyBUa
	lMrMTjkVLo7XfbxZ9cClsO33FCpvL6RyJoXKxMkLwd8vi8SoNoIP1Ua4KSyAjwdo7li2SYlooS8
	ns+sfT+l5N4xnmGW3k2o/PAAS1Jf9mHS6bSMmgft0gp2SGm2+xicwKjSkEmVngrIO1toYtq8xLr
	O5CVdEAABO3Jp6jJ1wOkoqhIpTGcWgWJndBx71pzotkOLaRy1rVtJtzm/a1f/QRYYUOJmUQJBdb
	bQ/8518g87Jd0efLAJxJIZq4+3LBCDcvebYdnih2xMF1pm+NiGzOcM8PTPCVFJMG421ZJhA4PJ/
	wWWMrKLxa9IhbTjNU5I5YyBC+VE8aDp7PdBEuKyoIQ+8eqzX8osc99AgJscqt9C/pC29rHkpmhy
	6Stk5R9JxP0pj/
X-Received: by 2002:a17:902:e950:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2ccea371d01mr20348835ad.3.1783510600782;
        Wed, 08 Jul 2026 04:36:40 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf7858sm26950825ad.23.2026.07.08.04.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:36:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] ALSA: hda: cs35l41: validate and free ACPI mute object
Date: Wed,  8 Jul 2026 19:36:25 +0800
Message-ID: <20260708113625.752913-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cs35l41_get_acpi_mute_state() evaluates a _DSM method to get the ACPI
mute state and reads the first byte from the returned object.

However, the returned ACPI object is owned by the caller and is never
freed after use, so each successful query leaks the _DSM result object.

The code also assumes that the returned object is a buffer with at least
one byte. A malformed firmware response can return a different object
type or an empty buffer, and the direct ret->buffer.pointer dereference
can then access an invalid pointer.

Use the typed _DSM helper, validate that the returned buffer contains at
least one byte, and free the ACPI object after reading it.

Fixes: 447106e92a0c ("ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 64a5bd895fd1..237059ef22f5 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1434,10 +1434,19 @@ static int cs35l41_get_acpi_mute_state(struct cs35l41_hda *cs35l41, acpi_handle
 	guid_parse(CS35L41_UUID, &guid);
 
 	if (cs35l41_dsm_supported(handle, CS35L41_DSM_GET_MUTE)) {
-		ret = acpi_evaluate_dsm(handle, &guid, 0, CS35L41_DSM_GET_MUTE, NULL);
+		ret = acpi_evaluate_dsm_typed(handle, &guid, 0,
+			      CS35L41_DSM_GET_MUTE, NULL,
+			      ACPI_TYPE_BUFFER);
+
 		if (!ret)
 			return -EINVAL;
+		if (!ret->buffer.length || !ret->buffer.pointer) {
+			ACPI_FREE(ret);
+			return -EINVAL;
+		}
+
 		mute = *ret->buffer.pointer;
+		ACPI_FREE(ret);
 		dev_dbg(cs35l41->dev, "CS35L41_DSM_GET_MUTE: %d\n", mute);
 	}
 
-- 
2.43.0

