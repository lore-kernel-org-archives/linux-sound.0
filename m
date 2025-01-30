Received: from 4.mo533.mail-out.ovh.net (4.mo533.mail-out.ovh.net [46.105.32.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DC81F0E36
	for <linux-sound@vger.kernel.org>; Thu, 30 Jan 2025 18:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.32.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262632; cv=none; b=MSMzEM3Bo5sUnfUxoCwu28yaSXE0wHZzLCYOn6a1p0gPNaxndKphTMr6IuDpGVGG4UCxPxJS0lBMN4Zvtx9CrBwBiQibmygmfye+bmVCBbAs/4JmfCpm22aKch4miWMMTUJPJuJj4LAhT+lfgpj6dxdJE+GaBm8HgbhqQDiKKJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262632; c=relaxed/simple;
	bh=YVWIWo85u5hak4ZDehYd+6ySUiPPOPxgbhi5jqGYi6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o9SZet9gaESzHA/FE5ASSzJWSdl6rjQj+ezaOlqIzRMdsJ50aBB97E0rf2ABhT9RKLutTIkMP+RsyMj0A2zfyfOJmjhwxdc/Wx+kVMeThsialLPc4POAw4DW0vMNOiVSGzzjGeM371mkHI8FS2PbrimLAU5DyYKnnk7HNTov88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jwilk.net; spf=pass smtp.mailfrom=jwilk.net; dkim=pass (2048-bit key) header.d=jwilk.net header.i=@jwilk.net header.b=JH6EiYR1; arc=none smtp.client-ip=46.105.32.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jwilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwilk.net header.i=@jwilk.net header.b="JH6EiYR1"
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4YkRpd0XDcz1PG5;
	Thu, 30 Jan 2025 18:08:25 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <jwilk@jwilk.net>; Thu, 30 Jan 2025 18:08:25 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.164.62])
	by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4YkRpc6zq1zyFN;
	Thu, 30 Jan 2025 18:08:24 +0000 (UTC)
Received: from jwilk.net (unknown [10.1.6.6])
	by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 15648BA3BCF;
	Thu, 30 Jan 2025 18:08:23 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-108S002ed52b3bb-0ef9-4297-8b91-c32c72ae26e4,
                    F0EE760B5030B34BD8DB10E393EFF7D58630AEAB) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp:31.0.176.244
From: Jakub Wilk <jwilk@jwilk.net>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: docs: Fix typo
Date: Thu, 30 Jan 2025 19:08:22 +0100
Message-Id: <20250130180823.1864-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13841813456255266039
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeihedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhepffduheefjeetheejtefhuefgjeegfeelgfeitdffleevteetueefgffggfejtdfhnecukfhppeduvdejrddtrddtrddupdefuddrtddrudejiedrvdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdpnhgspghrtghpthhtohepgedprhgtphhtthhopehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeffegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=VbxqCt8kz2eVzqYmPbkfBg16oahzMUnMeiet0IBiFxI=;
 c=relaxed/relaxed; d=jwilk.net; h=From; s=ovhmo917968-selector1;
 t=1738260505; v=1;
 b=JH6EiYR17ODDzJv6yaRrG1ZY6OC9CtJ4xqiSns/OLmuom1Fd2oCrB2P8/OoeHP/yCgcEDK0j
 CI3gK/yzb1J/7RD05IAgZVjntupDaUf94l21kA3bVrjLik+aMhFqIc7kmKciMlleYVhqgfwg1he
 oXKOVbICC/E9TXUWhBbA3NoXUpc1Gcl5HpgwTGmgZHTOE6ZgyF3yGwKOS0L9xrIYWUxEUbjPMxs
 s9A0RUowAi6HuIkRg3+rfSqWc8cKBJdSDntSmzmc9na002+D+j+TVGMWbh4loklY9ZLj9CdG0nr
 uR6MrqlBk9f2SyKnWP0Vc+IRAlHEEKonys/fgu2xKK6yw==

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 Documentation/sound/designs/powersave.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/powersave.rst b/Documentation/sound/designs/powersave.rst
index 138157452eb9..96f618b3f0b6 100644
--- a/Documentation/sound/designs/powersave.rst
+++ b/Documentation/sound/designs/powersave.rst
@@ -33,7 +33,7 @@ automatic power-save mode with 10 seconds, write to
 
 Note that you might hear click noise/pop when changing the power
 state.  Also, it often takes certain time to wake up from the
-power-down to the active state.  These are often hardly to fix, so
+power-down to the active state.  These are often hard to fix, so
 don't report extra bug reports unless you have a fix patch ;-)
 
 For HD-audio interface, there is another module option,
-- 
2.39.5

