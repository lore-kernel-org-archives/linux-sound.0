Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5081FB1
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779498591; cv=none; b=VX1XVzO5me6luz0i0dy2c6/SJsYpOnENMz/5PoG3a8dBm9WGj5AL/GU/lJs17WNfSxmKA2kY6ZtgLIbReEbeFHFIE/W/m7Gdszt42mzuAWNglR2BOqNU9pJrBUyToe+3mUw96viWwJrgnDBreUMawo+9o91i2XZ+0jcPIuzdTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779498591; c=relaxed/simple;
	bh=TC0NYejr5fuCL0i2iG9MaRXfgsFnGzkkZllyYOQo/TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AHfcSrzIYe6KrTcdO3Nsq9IxkawM8aO0x/GCTmyagW1l6Hfg4kIj3NwBpba4eLlT3E3iVydfONyTM6ugvq+pGR0I8BExwYWnqIbBS9xpceFHPf0OloIvcOeWjhxtDfFaejNq9oV2JfD/ssHXJnmNw4+y+3UYKRFhGLSkDx3fIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kN8f8oN+; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kN8f8oN+"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so26435798eec.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 18:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779498590; x=1780103390; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/usoros8fO10n9uOTXVprcQvCa/NnmHmZjq6g41DIZE=;
        b=kN8f8oN+3N5NpfSs8WcJ3pkQhrdjJoV1BIZOm7Lj8PLcdJ6nvHCKP5M8Gp4EgTjrKx
         N5Zd5s8Gu4V6ZwZ0hQvVmyCl2xwa9Tb/qN7ysxerepctyTDMFYXkOhFPmTQ34UtPsi/0
         X32+HAJ0se1FNorPd5RHM6vyhPV0Ed1n1Q0F+n69/xfhXhb69SguzGW2agnc2zUDIgmm
         OGd+hoe3ZxDGD8B4tQya3aB3d0uykM+RuCKdK6CNoaDoFkZmvGneuLioYkscPHRkhe0C
         THiB+nN0PE8F+4Uc1BQ/mGPCWKVKs31uHrKPuy5bQ50m4XgXEeyBJorh/KibZkQ87Dw0
         hvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779498590; x=1780103390;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/usoros8fO10n9uOTXVprcQvCa/NnmHmZjq6g41DIZE=;
        b=gQtYYRGQnWLOANycqnnCxbMAUEpqD30HiJUaPQX7ywAiuMqx8bq5JUwMBjPLVBSl2W
         zM5GqLG0NxKTTRz0gjtM9r4QMoK93xw9xPsH6Zv0T50nWAPnLyOZbN1o61XCnM5S/Dr4
         FXGwxHqcOLQQgtqG1e+61rddTF01eVDyCFz8Pv+aWYad3EPlqZF2vvOzvNgaNPsAH3pn
         m9xgIcUsVjaGcH2CoXPI91OoNlwqA2TivzyyOuc4tjh/rR6cTVGYBno5Bjo+ZkkLWa+M
         0ZjAhFN+QZYTtPlkrtn7o3O0o1j6nyMmKNkXrOc8ACCpsYy6LBDaB5EOXzMgKOZ34TAE
         zbUQ==
X-Gm-Message-State: AOJu0YzZUhAOjmwbrf+izTU/jhzXrjRWwNz5HYwixS2xhbM9P7PUTQFx
	3Uh11sQS4TnxtnfwKDWEtPEdfHI4bph4t5iu71oirUQOAZ9QhLnSucyK
X-Gm-Gg: Acq92OHDN0t87ljLJxgVzyJijhn9L3Bap+2nBDAqrTD9Z/DckpwsR/a1wt8Kkf0CL6N
	S6PAdJqD8DV9Ie30IL07c3VnBW7Bv1Fzi7Ehxy87J94zF2S08MACXVellili4iLyLKE981KAKjY
	pHpVpSJqWWTMy9irbppjcu0oCzPczne0qTHTdf3KdnuSNxRYjFTwzuYmWnYbe0kpk9Yk8WBdCxF
	A1gKZz9NeMQ32czJHr9sYB9wSmzmP7sBMThp5H5A3JO+xg+VKRYEFRvO+IeOmDy79SbdkqFNmXm
	mrTNSnNzhJX+7bmpHLd5qa0TDzf+Sg4TbEPuOGxaPCczjEvfde6/I2yZ8TmprYJQpR8+7YbsX06
	5adjZMUSkVz488LFxDFfl4pPE2g+4UBAKZ0cTJHE4l4l5eK9DiMaOQVt2u5yn0MjZBN38yfVpZh
	tmbayPglM0DzazwOgKYrNtrPgR/YCdiNhGCEl3u9SLHGbxTxTf2bKGaMImtqufaeld31XUY1QzQ
	A==
X-Received: by 2002:a05:7301:6007:b0:2ea:ed7c:912f with SMTP id 5a478bee46e88-3044912be2fmr3071174eec.27.1779498589663;
        Fri, 22 May 2026 18:09:49 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245f4e5sm2395212eec.28.2026.05.22.18.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 18:09:49 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 22 May 2026 22:09:40 -0300
Subject: [PATCH] ALSA: pcm: oss: Fix setup list UAF on proc write error
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-alsa-pcm-oss-setup-uaf-v1-1-40bdcc4d17e8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtoY1XwVcRD7FKN6FaaVYSxd
 1+nx+/w/zOYFBWDczdDkY+ajkOD33UQHzzcBbVvBnJ0dAci5Jcx5vjG0QxNppqxckIXuA97T+n
 kA7Q4F0n6/Y0v17+t3p4Sp+0Gy7IC3G6M9XoAAAA=
X-Change-ID: 20260522-alsa-pcm-oss-setup-uaf-04ad4312f714
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+8e498074a794999eb41c@syzkaller.appspotmail.com, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2695;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=TC0NYejr5fuCL0i2iG9MaRXfgsFnGzkkZllyYOQo/TU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkC/8JtvDQ2LI4Rszw/5esJSeP2CZfFfPwt162oWsllJ
 Z753DS5o5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACayR4GRoWGFs8Vkmz99BQyn
 WCYUs/McubZWTTS259CX07P7K5q1vzMydE1nu55nXaYqvczf6a5QBVvu5FtdqREbTn9dP7Hudfx
 KbgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_pcm_oss_proc_write() links a newly allocated setup entry into the
OSS setup list before duplicating the task name. If the task-name
allocation fails, the error path frees the already linked entry and
leaves setup_list pointing at freed memory.

A later OSS device open can then walk the stale list entry in
snd_pcm_oss_look_for_setup() and dereference freed memory.

Allocate the task name and initialize the setup entry before publishing
the entry on setup_list. Also fetch the initial proc read iterator only
after taking setup_mutex, so all setup_list traversal follows the same
list lifetime rules.

Reported-by: syzbot+8e498074a794999eb41c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a1062b7.170a0220.35b2b7.0003.GAE@google.com
Closes: https://syzkaller.appspot.com/bug?extid=8e498074a794999eb41c
Fixes: 060d77b9c04a ("[ALSA] Fix / clean up PCM-OSS setup hooks")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/oss/pcm_oss.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 33fd34f0d615..746eaf93e1a5 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2974,8 +2974,10 @@ static void snd_pcm_oss_proc_read(struct snd_info_entry *entry,
 				  struct snd_info_buffer *buffer)
 {
 	struct snd_pcm_str *pstr = entry->private_data;
-	struct snd_pcm_oss_setup *setup = pstr->oss.setup_list;
+	struct snd_pcm_oss_setup *setup;
+
 	guard(mutex)(&pstr->oss.setup_mutex);
+	setup = pstr->oss.setup_list;
 	while (setup) {
 		snd_iprintf(buffer, "%s %u %u%s%s%s%s%s%s\n",
 			    setup->task_name,
@@ -3060,6 +3062,13 @@ static void snd_pcm_oss_proc_write(struct snd_info_entry *entry,
 				buffer->error = -ENOMEM;
 				return;
 			}
+			template.task_name = kstrdup(task_name, GFP_KERNEL);
+			if (!template.task_name) {
+				kfree(setup);
+				buffer->error = -ENOMEM;
+				return;
+			}
+			*setup = template;
 			if (pstr->oss.setup_list == NULL)
 				pstr->oss.setup_list = setup;
 			else {
@@ -3067,12 +3076,7 @@ static void snd_pcm_oss_proc_write(struct snd_info_entry *entry,
 				     setup1->next; setup1 = setup1->next);
 				setup1->next = setup;
 			}
-			template.task_name = kstrdup(task_name, GFP_KERNEL);
-			if (! template.task_name) {
-				kfree(setup);
-				buffer->error = -ENOMEM;
-				return;
-			}
+			continue;
 		}
 		*setup = template;
 	}

---
base-commit: ef807cc07dec16edc7863d437e9250e20cb73741
change-id: 20260522-alsa-pcm-oss-setup-uaf-04ad4312f714

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

