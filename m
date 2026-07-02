Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED233890F1
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 06:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973930; cv=none; b=nnsxO+IWMcRevF2f/vhIoM39OqTW5JsMPscX04E567AFolVBLzIpLMPL+1cc4yro3F5iyI4Te88bVDx5IuCm/lUxthfIb+3i7Il0Q17cOuKeR+snQcA/K2PM2POOL/03DAr92ujqjQZ0sXDawOtCZ4SNbFOemZ7GUqziExB5dSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973930; c=relaxed/simple;
	bh=ezSTqTTyBGFhigxAlLrLusnQsmbWlTjeDJA634A9ywM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7/alq3HWh4hZjg2TCEwIlZtcy7bck01NgS6K172CUsavqba1rxfnyH9MGiqiw5ndXG5Jxk10ucudsG9OAOJV3MGEnqr21GXV8wPShSpXbPbjASw7eybJmMFDmNO7U4d6F+u4+Jh/ec55A2I/YxNgu8nf1x7TDr/TMqMFyYzfs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TszyZBfc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TszyZBfc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c9e89fded0so12955215ad.2
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782973928; x=1783578728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oyuadsrLS81NHqHm0Hn0mdT4fJKqMPl6qVcybVPUQso=;
        b=TszyZBfcRuBW7xOFTDN1+Y8R0K8Boi95oOnhT014ISXFobsAhsM1WLuXMcEmivc5BZ
         YldRbvUq4i0bWn7/GnSSB7o+Uybh9ydo52lCzdlwmCVJcYDOsIUxn3W9/RiJVOXFji99
         aC/gZ6rAKdyYqtHfeMKD2Kya6Wz/CTAN2pDXIGmb5elMJbsKxcUVd6lnnN4q5Gwhypzu
         lDfTJ1eaYI12F105M7cbGRbyStQew27OF1d6QTSkZWhyYTU1Dv8BH4LFaGNyRif8hiaR
         A8RQ4biwPci3xpswfxAK9iSh7swz8DfuZREe+ncjKeia7Qt0EA0DwhEFw0P9vSLyEgZn
         N3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782973928; x=1783578728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyuadsrLS81NHqHm0Hn0mdT4fJKqMPl6qVcybVPUQso=;
        b=d9sFqIBs+muvEHqHzww9L0jWjz06gEUQuC0nfYgowT3enCtB5AJ8mXWtdMD4eJhjCS
         AMFMWx/E8Ec7mWSSFoWRGLcrlowkp3UzxhYmYOo/ShsrcjseQfVDW1ZCISC3pTIWwfXm
         p/uzgD9CFu8TiFUnjWfir3BxMlh8FXvp4w5H77NKauAwbJSKXuA9doS61c7MsapYC8cN
         ETqFIoUF7v0llhZdDp93QD7RujxyF/xVA+wgO4S1BnUIYy7hynqS04yjjxc8HH+D+HVT
         5jz4W8mfEkfko2bvd0OkQkdk8P9IGSu3ymqIVWOAzZ72cBvMSuVIfmdeMDmVIvJz0boS
         2EbA==
X-Forwarded-Encrypted: i=1; AHgh+RqwYOj7AubmieK5T9JyY5WY7TFHcUfjeDUi/kZpsYHeQcPtvvp3SqhbiLI+Cj4K4NbG5EwNPnX/JZWMGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynAX3fvpn4aSH08fVHluFdWPG4pABslcVOfQPI/MExCw5NQpy8
	o0VtzpNqTcRWWQGzCOSRgzjrgLFWw+QBcQiWlMqFFK6N2Fki3IpTdH0S
X-Gm-Gg: AfdE7cm7+VN6F+0k2lcqsgZchxJlT/vT9mUEK2fWO5kytJgxv1TLvkfI4I314FkhoLU
	tsRO7BYrQ8vW1LS/bmbhy1LKiXKpuSOfz/U6VG7oafKmv0BOsWn9vesMKlU64bZsdE0P1mykNwv
	Qz7DuCRAMYEGdzDf6eXxmeZp60TwBHOvAigKbmCSsbWshM8/s3UvmEDzLjGKSx/iFeAWqCLkjcx
	RhNv/q/ecHIA47a4bAL8c/cnWJ6+FH0JXqm9S1Shh3mMa8THIl7FLa66ZYojxn4VQxA5jsmpDva
	eucwOn/OZWa1RCY0cKPb53ebLnXFHSaxCL+v24JZBMLfVSTEHDS0FTciMGKD6233dWfxU5UdDNu
	sweriuyCWHRFlNXAZBhU+zvTLFEovVZcDGl6GKrBtwdZeItyUrc9KyktANS17Lp5cWtSi/+02Xl
	bpnBgogStZuZ13JdW6RLFcsyUUhrUZFt+KtXCAa22GoAJ3csw=
X-Received: by 2002:a17:902:f712:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2ca911d7bdbmr33936035ad.22.1782973927785;
        Wed, 01 Jul 2026 23:32:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8dec40sm8676435ad.5.2026.07.01.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:32:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Kees Cook <kees@kernel.org>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: core: Drop redundant stream_open() return check
Date: Thu,  2 Jul 2026 13:31:53 +0700
Message-ID: <20260702063153.291425-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The previous conversion from nonseekable_open() to stream_open() retained
the existing error check.
Since stream_open() always returns 0, remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/rawmidi.c           | 4 +---
 sound/core/seq/seq_clientmgr.c | 5 +----
 sound/core/timer.c             | 5 +----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 4dfd9d53e6d3..789254a88e53 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -441,9 +441,7 @@ static int snd_rawmidi_open(struct inode *inode, struct file *file)
 	if ((file->f_flags & O_APPEND) && !(file->f_flags & O_NONBLOCK))
 		return -EINVAL;		/* invalid combination */
 
-	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
+	stream_open(inode, file);
 
 	if (maj == snd_major) {
 		rmidi = snd_lookup_minor_data(iminor(inode),
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 28782e1776fa..8fe872367568 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -296,11 +296,8 @@ static int snd_seq_open(struct inode *inode, struct file *file)
 	int c, mode;			/* client id */
 	struct snd_seq_client *client;
 	struct snd_seq_user_client *user;
-	int err;
 
-	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
+	stream_open(inode, file);
 
 	scoped_guard(mutex, &register_mutex) {
 		client = seq_create_client1(-1, SNDRV_SEQ_DEFAULT_EVENTS);
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 51c6ac4df9f4..937d7996f7ab 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1531,11 +1531,8 @@ static int realloc_user_queue(struct snd_timer_user *tu, int size)
 static int snd_timer_user_open(struct inode *inode, struct file *file)
 {
 	struct snd_timer_user *tu;
-	int err;
 
-	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
+	stream_open(inode, file);
 
 	tu = kzalloc_obj(*tu);
 	if (tu == NULL)
-- 
2.43.0

