Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E052AE8E
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 00:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117642; cv=none; b=r8GhP3KClD1NGdGF7VLq5JNOV5kLHRmdR9VQ+FYKQPgO1m5WjNIn0UypsIyGo+oOdXDfyw3Y7p51DFCzbfyOihl6ygW+sWNeT+cKLUn5N6tQ1IfCY7j5FpwJQip4YR1bSxJBDQqY0Sf1HODUNfyfSd3EJxTaVMsHaQbI3Zvn33E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117642; c=relaxed/simple;
	bh=ne6sNNmi/Sq9WoUQRJpt6WlUSrdrNb2Lp6QnTJADCWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UzziHbL1GkRqfgaASsVDViusWhnCj+o+OSe07ilIA6UygF1RWq/3r0pLO9NnCM7qe+m6Fnn/nyMlRG5r5dZ4EcNVj8zxdoPCWIE/dbJYuXyRU7i5xvs0xi5XA9oedOZheY5ahxh5sZ4MjMn0QlNARbSaactpSoNW8v8GQtO5B5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=Dcluve0j; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="Dcluve0j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n34Tf9kTcN4gTF5fMkGRZ9Xk4tlIy4QqpY3JQ02oSYY=; b=Dcluve0jWbUaCcKwnxKz8VpP12
	KRIbP5N6sicVmncjrYUhX52JKa+DEzupb5Gtpf4fZ0RDT+5C7omx+Tch41zx8vW/o7yayuXSepncn
	mdkxLJrUJKcBWkgEaA2yu4rj9UO3YyIYAD9HqzC3v7yw8m97ikpry18NLv9MYVRwNzOIsZUu02dQZ
	4mPHOCeY3SO34cAnUFlnOoprQTrs1pO51L1aXFF17sBBOsx6IUYH0552Zgky0x2I/3p17nh0TxZri
	NC9bdqUt0iyFDRQbbaoG2tqWwk2Hu7a45Q8Wx73pfweREiVYhZDqPhmH5pMzasn0X8ot5sfb1AqF4
	wKhInH1GvUtmut0tczKT9uiDufyC91J3mmka+SjJ5gbxa8/8ony6UB7HztOgY4Ey+t9eaj3JO5Jem
	ng2tQsr0PgoFtXW4JEPhPL/wlO6azN17EBCC/JULKAalVUxOwFfg7InVRITGXn5wEBqM58Iyizwlt
	/xJtgNYrFc411kBw3kmgdpKwFzIp/ZwmwMRcOrpNe6wqhU2NfUtNkAqvgezyX3KCcqxB1rPiyyUNn
	LfBcYFTpeSBjsa/ff5WS4bgqWkodrMjiH4fwaize+/CxLAaLXryqtzg3OayEhTozX0Y+l/8pDUp3e
	4EdXf15DE05g6qGhZeXximWxGqWNqlDxyp/bVHpOE=;
Received: from [2a02:587:6a0c:9900:f7ed:bcf0:918c:fb30] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1vO3YQ-00000002Tpc-3XO3;
	Wed, 26 Nov 2025 02:38:42 +0200
From: Tasos Sahanidis <tasos@tasossah.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	=?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH 0/2] Implement jack detection for HP Thunderbolt Dock G2
Date: Wed, 26 Nov 2025 02:29:55 +0200
Message-ID: <20251126003805.2705503-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds jack detection support for the HP Thunderbolt Dock G2.

The first patch modifies the existing realtek quirk for the Dell WD15/19
docks to allow changing the commands/algorithm used for jack detection.

The second patch implements the detection for the HP dock.

This series was tested against both a WD19TB, with no regressions, and
an HP TB Dock G2 without the optional USB speaker audio module. The
module shows up as an additional USB device, so this should not affect
its functionality.

Tasos Sahanidis (2):
  ALSA: usb-audio: Modularize realtek_add_jack in mixer_quirks
  ALSA: usb-audio: Implement jack detection for HP Thunderbolt Dock G2

 sound/usb/mixer_quirks.c | 122 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 115 insertions(+), 7 deletions(-)

-- 
2.43.0

