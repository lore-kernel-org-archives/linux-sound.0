Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404485;
	b=kgrsY+PwzyHKVvOeb7hgrvfHNWs8flG2gamEtJpstE1DOT/GCKK+R09pZK9gglcHMkAN
	 IAzR/WzPy5C5qsEK5eJlTKl+lnci/vblajto8F4yFsohn4C1F4ScxMhP2tltdGurECzaD
	 RPnH0okKQEiAi/u6u3D4HP16h2UIKuU+1Bc+xRRNY3SNpDiHz/owe3+JEx7I/jWJlBzeM
	 cLZeQkVo0GJn68W7oKLxNU92FGAR0bkhqP4q1OGbvBqY3wDl89QhDLzT1AwAZoKLYqAK+
	 I0VfhA4ipcElriZdYnofENgxuzdeQFDD0xHkLOBnR3NMWh8HuWlGuvM3ArHEvDxSAqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404485;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q3kZGC0uAv7mDcOauD1MOZfUEdWCpqbSFrC5+aUK4G0=;
	b=Ob+L0HsvP53Gvrge09M7x9CfV635xD0R0nnfov5WPr2T+vdYgF2ixEm9y7GPMJ11xwva
	 8zzB3HjC5qhFGNNwhbx117hcmTRdv0ji/4k0jd0j8gT8tmNAMfoLCf0RE+H2LDvXIk3Sb
	 2/+IXT/uaOiIp2NXjDSUFhlJUYRe1XbsHn8+MbBEN0AyDrMPV5Rn1Gp1cVFiWN1ET9+3F
	 G/l6w5N8Xpjx7NvYj5RM3oBABt/uNgkWw81jqlx4aspKHKGnr1XJUMJ1m4P5l7U82tW7v
	 ys+GtZSIQenvN/LeNNbV9Tbrbp7td5rfgp/4wqHAUsexgUqTfO+0hOEtM3Kav8kKqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=I1oQ+GzX;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F404606A339;
	Mon, 23 Nov 2026 03:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F404606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=I1oQ+GzX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=I1oQ+GzXy0kzGHkATdiv4VdakYA2r1NMptee6WbeC1v9d7pzmc4K+jNx0smi5968YaxYOFyAhQrTw
	 IkFiehrQ8DPTAKl5wOMZFfyQmzC0LjI34WxLP22smOtB7DICB06aipOPr2YFGxPHAHgM9boNFXuEZN
	 hosl4kQjBCbQ3+YU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b03b2c359b-74d06;
	Mon, 23 Nov 2026 11:28:03 +0800 (CST)
X-RM-TRANSID:2ee26b03b2c359b-74d06
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16b03b2c15c7-84e03;
	Mon, 23 Nov 2026 11:28:03 +0800 (CST)
X-RM-TRANSID:2ee16b03b2c15c7-84e03
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hdsp: enlarge the MIDI name buffer
Date: Mon, 23 Nov 2026 11:28:01 +0800
Message-ID: <20261123032801.1410-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <87o6boyhj5.wl-tiwai@suse.de>
References: <87o6boyhj5.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Verified that there is no overflow with this driver.  card->shortname is
only ever assigned a fixed string:

  sound/pci/rme9652/hdsp.c:5053    strscpy(card->shortname, "Hammerfall DSP");
  sound/pci/rme9652/hdsp.c:5354    strscpy(card->shortname, "Hammerfall DSP");

so it is always 14 characters.  " MIDI " plus id + 1 (a single digit for
every card this driver supports) brings the formatted name to at most 21
characters plus the terminator, well below the 40 byte buffer.  The W=1
warning is a false positive because the compiler cannot bound
card->shortname.

I will drop the patch.

Thanks,
Aibing Chen


