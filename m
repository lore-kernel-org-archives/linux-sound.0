Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175536;
	b=bNXczntyiS5hcqYqb9Y/H0rRCHAnDtBgtJQnXmdlicnWl6Zob7wImLj9neo1X2gRnD0i
	 Zlm0ZfTKFazR7gASjqEqUdgacR+qKqpedyNLNf1rF2afwnT6IwXX15gNcgt8Wd10WKOkL
	 M3aeNdsKxEmGu9H+9eo5RSzxlqKiVVGzszeuHXNeeVtfEJZ6xfHXlLkFBeNmPW/Rvh7WB
	 X5ikji1DX9vSmBTOLvXunPN4k5BRDViLrnAZKFktr8xkJ/nEDNovX4SR7jQwSawEqowpB
	 ++UR/iTHIDc/SR2/i8GgoCThj4kaZLvD3GWmIwzqe4+zv+1YKlG+R6DJ2LQImb66QnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175536;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6U0x6zb/eLO8pb0TQcyPNt8KKffqPmorv4cwNM3Ztlk=;
	b=epRiu5+zwYH+ZUajIQXowZf12Z8wDWsxQ2W234dlSu0qlsLva6DMZm8SYey5IJscaVNh
	 6zLy/tSB7/rhZd0qL4D2hv10vbq217Gm7+a+MWdritnQM0ecLq7IDDlRI2qQ7n+esAWM3
	 SPPgs+wMAUPNqRZj2dgxPdQDq7DsLOypDvUVmvLp+bO0VwzF3pEYRWNgoDQjw3Tq5q7ia
	 Imn7Yd1dehBJVrCeddEnL05BTYcj19vUBuOuF07YvKhGKDYPTgBimHI2SYsNYH7fx/arh
	 Nd6VqxgnabHK15S0P92PWOcoUHyFVIsOw4l1UWNk58MLoN9d3TGzEEHvxQ3ATJO2dJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1T2+ruU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1809606A326
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1T2+ruU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED881F000C0;
	Fri, 20 Nov 2026 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175535;
	bh=6U0x6zb/eLO8pb0TQcyPNt8KKffqPmorv4cwNM3Ztlk=;
	h=From:To:Cc:Subject:Date;
	b=l1T2+ruUsM+wgEXKYfWv9jHEyp0gNZGcXblbR5tQaCnbdst9awZctVyxkupwjbK5J
	 N0zWasdDdsJ/Dra+jvnA43o/T0IQntLbJGCEV2WgK3VnPQAHhOTfCS2pX8OUWCVXS7
	 l9OEjXdNKpD1RX1uwod66DnT2Q79fu9LvT9ywC5d/K6eCwfbwLFo/XKkcaBjSTujaz
	 A3QNFIKD6BZPb/eOCg47RtNomGS7FADedTz/dhzrdvaA/0TnwYd5A4S5Y77e2gO/DO
	 nkm0AIsdbfNwy+1hgZF8Ac/mY5xEH+3i8AUp6qx1GT+QeRgYF5VUnJNjV2vhkwy96U
	 lIdm8+j1m43MQ==
From: Thorsten Blum <blum@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Norbert Szetei <norbert@doyensec.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: timer: Simplify snd_timer_user_tselect()
Date: Fri, 20 Nov 2026 12:52:06 +0100
Message-ID: <20261120115207.810114-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779; i=blum@kernel.org; h=from:subject; bh=hJ3JTm/+GePJ+rcVv4Rux3SUTqeaKRSRPt8aZtqbSrg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDNkMJunJy3WddBWnLS0v8dq4OKL01T6THSuXHEjXCmedu CDkw6qnHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRxgMM/2w2Lnv41chf7EVv /ouHntOL7uXlbc9wuBSyJLdR9Wuqbx7Df5e5T/ofxUnJx02O52q+uchnkvLy/W3bzew9zzs+256 1lAkA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Return errors directly and remove the now-redundant goto statements and
the __err label. Also drop the unnecessary err = 0 initialization.

While the current unbounded sprintf() works correctly, replace it with
scnprintf() to bound the formatted string to the str buffer.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 sound/core/timer.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 905176bf6948..f977eea64f31 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1802,7 +1802,7 @@ static int snd_timer_user_tselect(struct file *file,
 	struct snd_timer_user *tu;
 	struct snd_timer_select tselect;
 	char str[32];
-	int err = 0;
+	int err;
 
 	tu = file->private_data;
 	if (tu->timeri) {
@@ -1810,18 +1810,15 @@ static int snd_timer_user_tselect(struct file *file,
 		snd_timer_instance_free(tu->timeri);
 		tu->timeri = NULL;
 	}
-	if (copy_from_user(&tselect, _tselect, sizeof(tselect))) {
-		err = -EFAULT;
-		goto __err;
-	}
-	sprintf(str, "application %i", current->pid);
+	if (copy_from_user(&tselect, _tselect, sizeof(tselect)))
+		return -EFAULT;
+
+	scnprintf(str, sizeof(str), "application %i", current->pid);
 	if (tselect.id.dev_class != SNDRV_TIMER_CLASS_SLAVE)
 		tselect.id.dev_sclass = SNDRV_TIMER_SCLASS_APPLICATION;
 	tu->timeri = snd_timer_instance_new(str);
-	if (!tu->timeri) {
-		err = -ENOMEM;
-		goto __err;
-	}
+	if (!tu->timeri)
+		return -ENOMEM;
 
 	tu->timeri->flags |= SNDRV_TIMER_IFLG_FAST;
 	tu->timeri->callback = tu->tread
@@ -1836,7 +1833,6 @@ static int snd_timer_user_tselect(struct file *file,
 		tu->timeri = NULL;
 	}
 
-      __err:
 	return err;
 }
 
