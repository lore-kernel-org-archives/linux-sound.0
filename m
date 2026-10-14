Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFB3C09F3
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005684; cv=none; b=GQnKQm+0BdOFUs/CE9gMguy2gSUZJDRb4+rOCoaP45kvYqalm7aZWljDInLMtU90x7LU0wv6m178JVAfwLImYFoO96eSiL9E66VyMOXUkZ67xMfEwxGsNnmS8F5/YfC9Pz+FQdm1dYprz8lWmsECuj7qdL2Dcj9DUtK5JVVk8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005684; c=relaxed/simple;
	bh=UrMyo00SNY2ABPsFiD1pr1qfiLMNapahXhN5HWuZbvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAbijKibca4eUaywlVZu8Gstn694vHNItcBAg7JWyQa0SnX/wsYDmJfpy3z+8n6sF5JE9D1CgGGURTnRtXKsgenZYmxryRLKClSG9ZLab9lLdGY3NASCDv0fyisnGK6R/8VdWRBDnQGWCZClCKqGGwWuVZ+RXOysUm6bevCtdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=H1gVrXDD; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="H1gVrXDD"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-354ba08cfd1so7513692eec.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005681; x=1792610481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKWPHyXm/RBE3XBdWdQ17S7GMceJugCqc25wfMm20QQ=;
        b=H1gVrXDDyQ8UIHoIheY/+RwT1BBtBVvr01/IgjHfyZE7qdDB2zt7DWFgONB1MGERH7
         54ifE5QIzGtLNpgOKoVBC+4nLj4LCAQDu3eSPf/l5DB4JRZN0GNgUMlKinpJaBlJIn9m
         Jl32acUW65YGx7i80VXQLOc/kSCrsaH2tc0H4DjPk5EJszqKvXF9taA6jt9CWqIEs/7n
         6jJj4fdU92UuAu3uOThf3UwkkgCd8Dfc8VX8MXdt/oQvnzppu4iejtPSLZ44k7TIfHR3
         Dv4/vkZeg1JRpumV2kljA9C8WjgCSAG30fzdrZI/DM4f7AtaBSmKKdvBBytwDqC0vkHN
         iH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005681; x=1792610481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKWPHyXm/RBE3XBdWdQ17S7GMceJugCqc25wfMm20QQ=;
        b=s/gwv8q4P/AhXLVSMokawV9O6iRYrU4FUCaaV21GTP7uHI4/TnqFTBtThK+LvDrHSE
         2EsrJdeVPd+1ZDx+jvbq5vm8wYkT5YP9CJKiTQcIhKeW5z7/CtDcYWl+bafXhdw8LoCh
         wVGIGstZycaUiBTisMulvdwRMWIUuAtGrDFHE0UbC2KBxO+lZ6LVwp4/U8H4/6QUceBx
         ol5kRMtvDjPy5TpEcWVDSmuoGACpSnB0j9znx1CeMFL7xZ5UhNf2MNmxKQoNcREnQuPD
         wd6wq98LSbQ378/Gsy2cWwOaoq+otUAOxpd2NqgSRDRSOwNGy8kDiFx3N5YMfBrYVay4
         LOIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWGt3lzGAUP9H9yOll5/7nrfn+p7hp9mfHoKsIekPOiyTMb/1AVhern2mE0A+aLgOeBmQYhNeOcczdxA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUW0eY+BbfgiWJxrJQNSE8osaHdFhcD7ePhlwYeM3DMCq+pflJ
	iXUV8/iZus0wAjVHUZig9NwrDIdnIpoJlXO3DzutQfmT0Yat6ev/K9bnnrptnBjJL/8=
X-Gm-Gg: AYBFou3gH4KKbptZKsvQBbNIVZEyRt2qhyF5E6+J1OhIZAvjx7+UAvQOw0M4q/GLKfi
	xgUh8lWOZoV1OJxXFCg3M6yd/+3tUejS1enNFMpzhGPw3utK8ST9aBGGooMz9TR4QmwHyHM3jzB
	LtCKUZuJZKG3QAPGnkeLFBcc1dtxP0a10kZHwjm4Xwy22Q5c43LfyvhGK4cFKRcHBHVMv6yKNMe
	Li1XfnHC/KIBW0KUiTcxr0AbWmdXUSPvUdionhCYWM6XJP+52mfYxhgo7uCWTP/hjxECJVIAm9d
	U07y/4venpSGgSk8/n95UmvTQZLNTe26RBCSQbPOQEDMT2xCkdjPeuDpxvy3PIWSvp+fB2vZvQe
	tkvxDF1iPSdd1i50YYPINNyoPeoErgnl0hVjqtalzVxrjvrus+6DwOZPWo2d+ObmjFa9lGall/P
	TyOnDGxkrPYF6p/j1uOnZmUzYTnQuenxcXdz5os17GFOoHFmmEN6QIOFQzYOkwzy6eo/uuHXQr4
	5uV1gNypVSv/ycsl0rW1dtecZDqPKAUSfWlUT+yrepn7d6cnUZOQhA0X4g+f3BO/52psxI=
X-Received: by 2002:a05:7301:53c1:b0:351:5cb5:53f7 with SMTP id 5a478bee46e88-3537dedd531mr23549875eec.3.1792005681162;
        Wed, 14 Oct 2026 12:21:21 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm38670979eec.11.2026.10.14.12.21.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:21:19 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH 6.6.y] ALSA: control: Don't add invalid kcontrols to LED layer
Date: Wed, 14 Oct 2026 15:21:15 -0400
Message-ID: <20261014192115.24210-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 74e3b979ce8b78a690f8b94ccf2e2c965f7f5c11 ]

The kcontrol LED state layer tries to track the all associated
kcontrol elements with naive assumptions that they are readable.
But one can create a write-only element that has no get callback (even
a user element can do it), and this may lead to a NULL dereference at
the call chain of snd_ctl_led_notify(), as found by syzkaller.

For avoiding the Oops, add a sanity check of the kcontrol's info and
get callbacks, and just skip the invalid kcontrols before assigning
the kctl to the LED layer.

Reported-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/6a9007b3.1d9ded08.62e62.00cd.GAE@google.com
Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://patch.msgid.link/20260827113951.893291-1-tiwai@suse.de
Assisted-by: LLM
[ Backport to 6.6.y: After the target's locked control lookup, reject
  missing info/get callbacks via the existing unlock label so
  controls_rwsem and the card reference are released. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-90060 to 6.6.y.

The code changes are identical to upstream, except missing-callback
failure uses the target unlock label; see the bracketed backport note
above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/core/control_led.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 15acb07c651502d4dc22f72bcc9e3a47923caf5e..639d86e4dd1623df612ead223a11e049fbf39afb 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -253,6 +253,10 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 		down_write(&card->controls_rwsem);
 		kctl = snd_ctl_find_id_locked(card, id);
 		if (kctl) {
+			if (!kctl->info || !kctl->get) {
+				err = -EINVAL;
+				goto unlock;
+			}
 			ioff = snd_ctl_get_ioff(kctl, id);
 			vd = &kctl->vd[ioff];
 			access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;
