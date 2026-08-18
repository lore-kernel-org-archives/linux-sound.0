Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77E03C0610;
	Tue, 18 Aug 2026 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042347; cv=none; b=Iw6qZAHCC6VkxjOptiOZirziB0ic6viVtrkt1C8b9IoCYEVv5IqNm2aoRX2uHNbvJPm5Gdg8BHPMpaZuMUa4XFDU7SQumvLnQIS4AZRUD0bQkAcs+gJtQNSgATEORuEymTdPww0gJL6qIHUDKt3UD6/E2kD0FhrxqzMLQTz8bdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042347; c=relaxed/simple;
	bh=RVBWM8iqRNrWs1vi2GV/dQ0NYcYQdiRH9mLSaGskdJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVcueI7JvWA3GYvjCWXfIGHMr09ldPMXmJNeI6wY+AdH3TBDffpVTzOAXJe9+ap5KANc1Nowb5Pb7f7evNxnliU2WWsSWASEpBaxsMIUvLb4o/+qTijc/LxlKOAUSc+tnItrobcPmEcdj+jhfZtm47BLe4QgrSIb6jy5xu3UiKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=INXST7N+; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="INXST7N+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787042309;
	bh=A18LiE4rjXOCYIOMBPZwhup3l22ezLeFMbrIhB+zSH0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=INXST7N+VTkJWp7OCLijeWHmHxk4wbQWamlFAiMtOfnelNhNgPiF4TmVqvg8Z5675
	 DQmKpE6CcZXS3lQJc85jtGGhkM48T1F09eRE0t2z/un/olQ5xsqnzUVupEVph5XyhL
	 EQ+v2VwnUlePqzPBQvRHWzaLtmwQz/49XdSaj/GU=
X-QQ-mid: zesmtpsz9t1787042292t7ce51d29
X-QQ-Originating-IP: 4UdPmWVACr3tPKi7+sD6KosRsPPHd3GVuJCUZSLASbw=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 16:38:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12294350306650379102
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	kees@kernel.org,
	cassiogabrielcontato@gmail.com,
	raoxu@uniontech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Fix connection list comparison in proc output
Date: Tue, 18 Aug 2026 16:38:08 +0800
Message-ID: <7B802A4E225CC808+20260818083808.2735120-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NG8VJ60AcVdMMK4z/tQhp3IAULhe93QizxveD37v5hu8fL5fQb44/1oS
	T8y21ceQrzlhhq/LgJRm6Z0eGXjriO8ANM4h+epLimkxhG0VYhJJrRZPctH6dlsWH/2oKKR
	5ZIO7MncjxgPGyf3bFCmThrEJ+rX6WaIpUl08h+82C5oNwCYkQuTy1ARVa7luCC4lMp3vfP
	EHdvSgUoF4RLbF4x/1g0235E6fbJjxxBn3NinoWpPV30Yg5vK19V4WQuYeyfoMzJacnfjF6
	ZhQRst2duQpBLsxoPbYWBNMCPzqQN1QrS5eHE5EMtuw4luImbwRDkdiZ9x2eXoMGpTGmznS
	LLESRw+QoN6nMXuMHKAHPSiqeK9Rvi1LAYcQTrvUA9aYOI/VxZOA4ghz1MeUrFsW8DSk4cX
	n2SPpl3IUDICPxbckkjRufqCjAzmRFLQYQqmfdC670/34o9QLV1c1mkv8dvjzwY37qvaGEc
	bgOBFTO7yFqmMZNAp3qqqL8bVCXBVX4g7WfVFZeNd2Pbxj6XLapCrMFS3Kx7dsQfc45tPoh
	1J/KUqxcq8AQa9R9+cZbqldJhZ1bWc6/4f4BcozsOm70gm5kcosMKD69G7cX04vluH/P8PK
	z5cilvW93wtgFA8kllOYreJtuVrVkJxyRhB5flwOm4DjrtCyRmj0zy70bHrHEwATk+YlyIO
	P3H4cpBOXZ7Wp3vYecXbVVeIu9MZhB3p3uF8bh4r/k9gvah5OcRXIWs8C1iQko5FTsv4W//
	fkfgwUbcp463O/k3N8PSYQ0SFOiLFWK01uETW9rPVLoGREv9XLcoeA+WCFlP3uAOWE9c2Wj
	bIys+JAf7969G55J7nS3mPXzE9JDBipBjkzEMBGlkWJwuir4rAtdQ3zZ9faHqgclP73Q5gR
	c+Ht3KxOJGafd15rJTGrCbleKG3Xe220ywPXSPxkkpKd6he68gw4QgIUtVIDKh+3f8Y3eSL
	See2YLkOhXxZ4e6HOarHwW5C00n5F9T9hVUy+NOoJdLO9KSR7VLfFTtsxKWp2RqXwW/Cd68
	drKWZfxw8zfKGU3aQK+2wC+nvx90+WvzP70Qfotg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

print_conn_list() compares the raw hardware connection list with the
connection list cached by the HDA driver.  When they differ, it prints an
additional "In-driver Connection" line so that /proc/asound/card*/codec#*
shows the topology actually used by the driver.

The comparison currently passes conn_len directly to memcmp().  However,
conn_len is a number of connection-list entries, while memcmp() expects a
size in bytes.  Both list and conn are arrays of hda_nid_t, which is u16,
so only half of the connection data is compared.

For example, for two-entry lists such as:

  hardware: 0x0c 0x0d
  cached:   0x0c 0x0e

conn_len is 2, and the current comparison checks only the first hda_nid_t.
The lists are therefore incorrectly treated as identical even though the
second connection differs.

This can happen legitimately when codec fixups replace a cached connection
list with snd_hda_override_conn_list().  The codec routing used by the
driver is not affected, but the proc output can hide the overridden
driver-visible routing and provide misleading topology information during
codec debugging.

Convert the entry count to a byte size so that memcmp() covers the
complete connection list.

Fixes: 8b2c7a5c404d ("ALSA: hda - Add In-driver connection info")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 sound/hda/common/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/common/proc.c b/sound/hda/common/proc.c
index c83796b13d3d..3dabdb418c7b 100644
--- a/sound/hda/common/proc.c
+++ b/sound/hda/common/proc.c
@@ -624,7 +624,7 @@ static void print_conn_list(struct snd_info_buffer *buffer,
 	/* Get Cache connections info */
 	cache_len = snd_hda_get_conn_list(codec, nid, &list);
 	if (cache_len >= 0 && (cache_len != conn_len ||
-			      memcmp(list, conn, conn_len) != 0)) {
+			      memcmp(list, conn, conn_len * sizeof(*conn)) != 0)) {
 		snd_iprintf(buffer, "  In-driver Connection: %d\n", cache_len);
 		if (cache_len > 0) {
 			snd_iprintf(buffer, "    ");
--
2.50.1

