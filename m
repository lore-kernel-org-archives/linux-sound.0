Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0213BB32
	for <linux-sound@vger.kernel.org>; Sun,  4 Aug 2024 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722782276; cv=none; b=DDuzK2QXVH2e09ehkT/zKyHS4laOA4cAoEet7/Pk5rSi650wOT6KjYiMmQuBcyp2MczBn3sII4LGjoR+8evvmuLsVqr2XOCAYlpxcdZbbTTnGfweb+yhojBS5AfkRE4Q1EyvkMFoYga2sjj5k8I1pJh0bL0P22vYZcclRwEnKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722782276; c=relaxed/simple;
	bh=pXorRA7lrPRwZoEWKAUUzh/78rSwO0jHTLCYz2vam0E=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=AfelDN1P2sLpUfYF/oKbAT9rcipbhUpr5XY8eO/+5CYD/4cJozJ7GwU+lZvM4qW1yFh7iETwP37DHG0qK1GeksxsTSH/yEtfpTVStT+uMe4jOFl2NZqs5qVkaJaErj+0diyl4bNL87Sr+ER9zeVBmwwr/XFMUexDNvaghi0oFf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=WBpPihos; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="WBpPihos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722782272; x=1723041472;
	bh=pXorRA7lrPRwZoEWKAUUzh/78rSwO0jHTLCYz2vam0E=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WBpPihoshZsB88qhyMx40epR3RO0U2AE9RTAPNErCFu1npFSeu/UKox5HgESjmdhS
	 c/CIGJLwfR5EIN3i0oKzqJRo+ELPEw43jvOMVZxkEih4za/TVkFKX8N1NsL22GcE3N
	 ePM0zCrN8Q531n2JcQ/OfqrcmcGnv5lfATgHXBMKyw+CqCins83MqNIZEwFhMUh4TO
	 mGOZqpk5AtDJIdPMAWrankudVkqRJijAF/1bn6RaFS5wfPWLNAIla2G0Hzbm82AiKQ
	 fun3mQWmamIiju/s73hSBnR9Jm3Cv40wp/bt+wEmyI7+9nm6rzomeS6ODy4r7RhBBU
	 7Ee8Vi0RRef8A==
Date: Sun, 04 Aug 2024 14:37:42 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: David <DavidRLTG@protonmail.com>
Subject: Soundblaster AE-5 100% Muted on alsamixer every boot!!
Message-ID: <sK3xSuFdDg19iN_-dje3N1lN2yzFBVc2RnpsXwmPmHu7BgECI9SwTMKunms7BhR4pI0t86xG01OACEjZbIzDXKJAyeVNazB9cCV2vgSTDHI=@protonmail.com>
Feedback-ID: 35466975:user:proton
X-Pm-Message-ID: a4acd2fe97c60cdbd87bfa52707faf7af05823a9
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I am on Linux Mint Wilma (22), 64-bit.
Obviously, I have a Soundblaster AE-5 Sound card
The issue I am encountering is, well, every boot I have to enter Alsamixer =
and unmute every channel on my Soundblaster AE-5.

alsactl store does nothing, and yes I ran it as superuser.
Also, I'm on pipewire! I think Wilma comes with it preinstalled.

sudo alsactl store is also temporary, the config is lost at every reboot, a=
nd doing sudo alsactl restore does nothing.

Any ideas for a fix?
