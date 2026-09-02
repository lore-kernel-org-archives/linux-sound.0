Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6F38E13F
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334826; cv=none; b=KXo/PIDAaStahP9203nvwpYyQbX/UZlGPOj6I2VHJ/nPkRaHEUMXRbsCHrbkrFFSghx7aKkh7PFHSJTFfRDQUx3FsiqK12ZNK+NifHzYbfqMSXUky3pARqKIJfKg9v4h8TZdYaZcKsyIfVG/rIYP6NSfc2jdjiWVWeYVKdu9Kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334826; c=relaxed/simple;
	bh=hEbiDWALcEk6t+gh196c648EmC91vs4qbEzAk60h8pw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GGFsxMp7b0TZXF4FM0R+YBjolAfE7QUCj9DbfK66B/LFUfeuK3f4LIFBOaLK0P937Kc04VndtoNN4sn87WE/sx4L0cObTumhPmhbhrSQeCzfzKIOSjGwbzSKUeDeo5ZTfeYnnrZ29KPWIooA/vwn7aKjD8xksjZsKvyLhj/jbwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfjiNquN; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfjiNquN"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedf433a99so812718a12.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 00:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334824; x=1788939624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXcpK8x3d/kSx5MzpGpR7YXF+3TtZnzr1snN5gFSm2I=;
        b=TfjiNquNVd8vlmz9Tssg+fLYvZ6osrkU53RWPYsEg7xSWmhsk3iwCf+TP+1RyLJGkn
         MjSpfqQh1dCKDcgoLgcnxgy+EGMDyKqFMBx3wCwaSM36CcJ/JpKRs0/f5LTKFeXIN2Ad
         qeoCCZCZ5hzGS+lD7FklDwh/CeVzvBqzwRdw2VyXs3XTYqZ9dFv7Z91ccmBIcNG21SRe
         1jMUPQLoNBQnp0UqvPcrFty2oZLO64D+yXHrMgs8sgeIL2Xc6RtNRJ37D0WwO6rwB21+
         08Q6UDFxyqVBO/NaAPpRN/dz1JEABxRTYdtGbO6JlkIFhm8qJWTaVquakp+Gx5SgQwN+
         UlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334824; x=1788939624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXcpK8x3d/kSx5MzpGpR7YXF+3TtZnzr1snN5gFSm2I=;
        b=ayir3w5WO4aOwglypATMJyiTvx1RpQgwrkpdOhHXG+L1djZkJzKG3guQoydaYZQ9HY
         kNdRi4rf/gsr7ErSfMzB9J3OZqxjcPg8FWJXOVYLvh9zUBBAXthZgId7UhMmTGJ7mEn3
         iqT8zuGhcj0JMpoiP30q1W3HSzEbIdBIJwBQbivuR50YEZfuGJ/TgePUx1tWXEWjMlaO
         /4ElGuXY4vcFrji4Zo0HbdoDuJnlp4C3TPbCS7566Bg3ChID1YXET7Oq6sFUx+dJdGrd
         p8avhLI7W54ltu8W1IypaDTRkf4nwlaPDb0K3ymBD3GZKdLBkVAFYE5jzPwyO4hnGh0R
         1Wlw==
X-Forwarded-Encrypted: i=1; AKwUvBxqQnvmUTXTr7z4V161a2bDNnPl28IGSsE3blBJqj9Ck5iYwfz6ltML6ZKvqOg+xw2i8e9X8zGiPDlFSg==@vger.kernel.org
X-Gm-Message-State: AFuF++naRgz3AyMlkgfptba26cmjfd43XRtJCbv9w6rS9Zglrb11KkrD
	t+QGKWOfb6xaLeK4/5ZMukUc46pSiV5HQQ7O3+lzUDYctnQRE3mFBw4o7i/lmJDK8hmgnFT1
X-Gm-Gg: AYBFou2nINBtCSgHexQX9orXIVMcT4R0NsbjDh7nr3nHktF6GFtK41+8M18HkgOcTh5
	jH+UZ6LfhM2uznV7x7G+Y+/AzQNsxFN+mz4YSDutDSh63DyoT0zI0UURDUbkuIZ4tEx6e8PeccG
	f5/K/2wXnLHw0bwecbzjdVq5V4eG7tz7GC6us/9rmhDbDCaZPJ3mQvGEMknIb9SMcqNHZtz4pQ4
	6I+0PTf4RYcI+fUmyaehC1NunHLsy0z7zj61zAYN/YLfvO2nnoSuM93/gqKhhM77mQpj+dSd7bY
	uCADtsG5b3cLYPCQkx/S4SYwW3LS1Q2NJ0slbmZlCcHQ7GUHc+Rl2z2cYiHfAlidTS3g6kidW+8
	8tiUBOKjqpagYLJwlLmMvzZxK5FI2RV2twBDuElTg3MvA1iSUyVDjG0pa8B7l7SxvaufAoqy2Xx
	CyAr7IfaFMIKARwExZ8LYqilRDkUOQNTrbxc7aAStEE7kWKRdKp0qhrfXwB2mf
X-Received: by 2002:a17:90b:3805:b0:398:d843:cad9 with SMTP id 98e67ed59e1d1-39aee1c74a6mr3430385a91.19.1788334823792;
        Wed, 02 Sep 2026 00:40:23 -0700 (PDT)
Received: from cqian-s2.. ([175.159.214.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6e8d7sm4336775a91.15.2026.09.02.00.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:40:23 -0700 (PDT)
From: Qingyu Zhang <usupergate@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: do not touch legacy_rmidi before it exists
Date: Wed,  2 Sep 2026 15:39:18 +0800
Message-Id: <20260902073918.880245-1-usupergate@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_ump_parse_endpoint() sets ump->parsed on every exit, including
error, before the caller attaches the legacy rawmidi device.
ump_handle_ep_name_msg() then treats parsed as "legacy_rmidi is live"
and calls ump_legacy_set_rawmidi_name(), which snprintf()s into
ump->legacy_rmidi->name. If a UMP packet arrives in that window
(IRQ path from snd_ump_receive), legacy_rmidi is still NULL
(KASAN null-ptr-deref in snprintf).

Guard the legacy helpers. parsed only means endpoint info was
parsed, not that legacy_rmidi exists.

Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
Signed-off-by: Qingyu Zhang <usupergate@gmail.com>
---
diff --git a/sound/core/ump.c b/sound/core/ump.c
index d183c8a000bd..3d1a2ed3b476 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1335,6 +1335,8 @@ static void update_legacy_names(struct snd_ump_endpoint *ump)
 {
 	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
 
+	if (!rmidi)
+		return;
 	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
 	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
 }
@@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct snd_ump_endpoint *ump)
 {
 	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
 
+	if (!rmidi)
+		return;
 	snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
 		 ump->core.name);
 }
