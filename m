Received: from 4.mo534.mail-out.ovh.net (4.mo534.mail-out.ovh.net [188.165.54.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7D38DD3
	for <linux-sound@vger.kernel.org>; Thu, 30 Jan 2025 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.54.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738261028; cv=none; b=JrrwoiF3QCnG/aK4UR3AJkhpPRPLGAgf46uIVxlLYSRmYoxH2zz7DhRe/qGNOVd7Nn6X3+z5X4CoWHymEBnRyW1A6N27rK+Gdysb92KQz1Tpsn9SnzPxEjT1P4BKINzuazP2ZBi94Xj4Jt3FgW2cygj2XeMg90oQbtfNau6vSY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738261028; c=relaxed/simple;
	bh=XYd/j15c1CDnaMUhWEcG0hdyzTMYuehI0xHoS3cMlDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rwZsILCxbaJhJ9cwqbg1GWb3tmfCP5ExcX55kHv+gP6jFjYdTyKRWJmQsXYC0oAzCGVarmXb6r/8rvJaOLgZwkraPW4PGMPUAKi4K3brNbs9HcIJZJI0dXKO/bopRyhGAOKsb7zWDsFAjDmFUv7tlF5/EPkFbsw66KwIJTmB1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jwilk.net; spf=pass smtp.mailfrom=jwilk.net; dkim=pass (2048-bit key) header.d=jwilk.net header.i=@jwilk.net header.b=Y/6h3fvr; arc=none smtp.client-ip=188.165.54.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jwilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwilk.net header.i=@jwilk.net header.b="Y/6h3fvr"
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net [79.137.60.36])
	by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4YkRpf6rrgz1Y5J;
	Thu, 30 Jan 2025 18:08:26 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net. [127.0.0.1])
        by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <jwilk@jwilk.net>; Thu, 30 Jan 2025 18:08:26 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.108.9.72])
	by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4YkRpf6QqQzyGC;
	Thu, 30 Jan 2025 18:08:26 +0000 (UTC)
Received: from jwilk.net (unknown [10.1.6.0])
	by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id DD35B3A3BF5;
	Thu, 30 Jan 2025 18:08:25 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-99G0037988c6c4-6401-4d4c-9c17-f82e8211e531,
                    F0EE760B5030B34BD8DB10E393EFF7D58630AEAB) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp:31.0.176.244
From: Jakub Wilk <jwilk@jwilk.net>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: docs: Fix module paths in /sys
Date: Thu, 30 Jan 2025 19:08:23 +0100
Message-Id: <20250130180823.1864-2-jwilk@jwilk.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250130180823.1864-1-jwilk@jwilk.net>
References: <20250130180823.1864-1-jwilk@jwilk.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13842376406887181559
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeihedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhepleeikeeuvefgieffleffgfeifeegjefhveehieefgffgheevteeuteevffegudevnecukfhppeduvdejrddtrddtrddupdefuddrtddrudejiedrvdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdpnhgspghrtghpthhtohepgedprhgtphhtthhopehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheefgegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=M1gx2lIP0T8b+ubs/1epi+eFvBL8hYRr63I8jUex3Zw=;
 c=relaxed/relaxed; d=jwilk.net; h=From; s=ovhmo917968-selector1;
 t=1738260507; v=1;
 b=Y/6h3fvrhGKDJOdiaFcxZDbSyi0Dsh9KbGmYHbSMiPjsVTyScMbybPNKSY3HImpUfExHa+vL
 bgjAjFyQdeHCqo+QRBAUHYn0QzhZ5VK6I3fISc1cIkA1Fz3Jnw6CkcrwKg5qLvzr7p2CocSVKcx
 P7CCqIJcHatAKa0gGBu6Q1ubcPHl5e8bni4QNOrWw9WywKAonkTRUdM8i6ztzto0fBh6daLtB0y
 xKFEqWwrTes8t39WVWDKLwxMl2K+pTY0CxmhuQN6v6/5NhP3zrdS6axGxDjIhFlHKlHWGDQaupH
 h5og0Cqf/I/E+g+VZKrFUFDXrQ+b9/L+nhHWU+YaCDqwg==

It's /sys/module/ (singular), not /sys/modules/.

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 Documentation/sound/alsa-configuration.rst | 2 +-
 Documentation/sound/designs/powersave.rst  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 04254474fa04..a45174d165eb 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -58,7 +58,7 @@ debug
     2 = verbose debug messages);
     This option appears only when ``CONFIG_SND_DEBUG=y``.
     This option can be dynamically changed via sysfs
-    /sys/modules/snd/parameters/debug file.
+    /sys/module/snd/parameters/debug file.
   
 Module snd-pcm-oss
 ------------------
diff --git a/Documentation/sound/designs/powersave.rst b/Documentation/sound/designs/powersave.rst
index 96f618b3f0b6..ca7d1e838b4d 100644
--- a/Documentation/sound/designs/powersave.rst
+++ b/Documentation/sound/designs/powersave.rst
@@ -25,10 +25,10 @@ operations.
 The ``power_save`` option is exported as writable.  This means you can
 adjust the value via sysfs on the fly.  For example, to turn on the
 automatic power-save mode with 10 seconds, write to
-``/sys/modules/snd_ac97_codec/parameters/power_save`` (usually as root):
+``/sys/module/snd_ac97_codec/parameters/power_save`` (usually as root):
 ::
 
-	# echo 10 > /sys/modules/snd_ac97_codec/parameters/power_save
+	# echo 10 > /sys/module/snd_ac97_codec/parameters/power_save
 
 
 Note that you might hear click noise/pop when changing the power
-- 
2.39.5

