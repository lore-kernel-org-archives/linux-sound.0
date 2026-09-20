Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69503EF672
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897639; cv=none; b=TGFY6GYNPtS0o8ZaYuQYnuaehaT3hw4hi+1bgI04WxfqmtIaPlgEOIwAG3fsNTLl6jlxsieiHzfNpUqNDcZYZEPmgM7n6mTXygEeRKbKz3El52BfidZygfQ3cgfmy4Ut6kDVX6p7CzgxwPeGcwjTMoIX5CFdAPjUe9nZko14nfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897639; c=relaxed/simple;
	bh=juAbVDbXWVwdclRdyUAuVrgjmjod79dRpwb4O+mnDDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=itIAMVDCQw2H0jlX0TsSaH4feTU3LsZ07Xmoye8Y0D/uoFO6yHUmWL6f+6zvkapbnKeFnGxdVnTUoNLBO+XSDLWxuYNAYxAojcKMi+6kRY1njMqs+Yo84tWfiAc1IJU8A3boVJskWb7x7eoJmRbaoUSCCe63sbHkVS0R2CCcN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ya.ru; spf=pass smtp.mailfrom=ya.ru; dkim=pass (1024-bit key) header.d=ya.ru header.i=@ya.ru header.b=KocL9yye; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ya.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ya.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ya.ru header.i=@ya.ru header.b="KocL9yye"
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:4021:0:640:30fc:0])
	by forward101b.mail.yandex.net (postfix) with ESMTPS id CAB93C0074;
	Sun, 20 Sep 2026 12:47:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp) with ESMTPSA id qkVL0bUfYmI0-mYjTgxm5;
	Sun, 20 Sep 2026 12:47:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
	t=1789897625; bh=XivLuPnNLJ7QQFY4NuX99E26pUgzrXz0Atyy7W7mkG0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=KocL9yyeB6GY6Jqzx+lUPhAG++5Qa7ZmsjkeTn2IIlT4CIYEjaRRmUa79Uq3b/lNX
	 S0cDTcfO87fUpOIZZDRthpxKXv15XXOK+PT9PX8ZWc1ggpx/J8B23wk3HzxJ5bNgex
	 tXeW8RQ3vKbGLbXTxeZWUlrPNJJGzGNr4ZNgoLLg=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@ya.ru
From: Ilya Pavlukhin <i.pavluhin@ya.ru>
To: patches@opensource.cirrus.com
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	linux-sound@vger.kernel.org
Subject: CS35L41 firmware for Lenovo Yoga Slim 7 Carbon 14ACN6 (17aa3856)
Date: Sun, 20 Sep 2026 12:46:47 +0300
Message-ID: <20260920094647.18820-1-i.pavluhin@ya.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I have just submitted a patch series adding support for the two CS35L41
amplifiers of the Lenovo Yoga Slim 7 Carbon 14ACN6 (82L0), ACPI HID CLSA0102:

https://lore.kernel.org/linux-sound/20260920092808.17234-1-i.pavluhin@ya.ru/T/

With those patches both amplifiers bind and the bass speakers work. What is
missing is the firmware and tuning in linux-firmware. The driver looks for:

  cirrus/cs35l41-dsp1-spk-prot-17aa3856.wmfw
  cirrus/cs35l41-dsp1-spk-prot-17aa3856-l0.bin
  cirrus/cs35l41-dsp1-spk-prot-17aa3856-r0.bin

Could Cirrus release these for this machine?

For testing I used the files from Lenovo's Windows audio driver package
(support.lenovo.com, DS552749, "Audio Driver for Windows 11 (64-bit)" for
Yoga Slim 7 Carbon 14ACN06, v6.0.9366.1). In the CsAudio part of that package,
csaudioext.inf maps ACPI\VEN_CLSA&DEV_0102 to the configuration named "S760":

  Playback_6.47.0/Firmware/CS35L41/RevB2/halo_cspl_RAM_revB2_29.49.0.wmfw
  tunings/Lenovo-S760-17AA383D_20210811/17AA383D_20210811_A0.bin  (amp at 0x40)
  tunings/Lenovo-S760-17AA383D_20210811/17AA383D_20210811_A1.bin  (amp at 0x41)

The INF also sets ExternalVspkControl=1 and an init sequence with BST_EN=00,
which is why the patches use CS35L41_EXT_BOOST for CLSA0102.

The amplifiers report "Firmware Loaded - Type: spk-prot, Gain: 17" with those
files and play without errors, but I have no way to verify that this is the
right, complete set, and those files cannot be redistributed, so a proper
linux-firmware submission from Cirrus would be much better.

I am happy to test anything on this machine.

Thanks,
Ilya Pavlukhin
