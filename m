Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBDC2E7BD3;
	Wed, 29 Apr 2026 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449502; cv=none; b=Llpgfuyd53QaWsrrBf4w9IUR4UNZqhqUt5hnSI6c7LWslkQe3xWlvBEtXecIJ1b0BlWRC9mXbj20SJSU813tLgRXwh6STVWrWwA+HLKFGkM0GTS7/Nt5AsAWF/FjuFlp3962dZBOGwg/IPjgvntrmtfeErMI0ARKso4C7/eWkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449502; c=relaxed/simple;
	bh=YjoqPhVGT4ZpM/CysV+/kKdXV/PG8lDOVESHQottOAA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HHsW7IF1PEgeAm5Z4Os34TzwEaij1zNMh/jZZO0/nlQihUVTI3ni+i0GBG2y7PZCZiCB+5Nzxt3N48CtEGh0ONGEy6LNwr54bPhb2d0vH7ezwJUnK79Vrf8FYE5gvNDVxqVyIJgakY3YrxMzyvAI3Wfyqq/5vlfr9kBZRg1wAGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=d9DTK0GI; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="d9DTK0GI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449488;
	bh=uhX+w6XwKjqgyOER12UA6gBp12QqDAT2tbAmGEVGPNc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=d9DTK0GIYlJBWygbD4/1OiCyMmjZ6xJe8f6jrxy9Rdsy5ilN26l53VqpZPgCePpS9
	 sGWJENHegzoWpTUK5jV2oIqPnB+SAeZPnOVhEottL1rRO9NEdpRHBUc+uOCe6y+Hqr
	 TEv1RCUS2JWcuod/8XFRfI0fNQCHPGCXHG1/HtJc=
X-QQ-mid: zesmtpgz4t1777449482t561b6079
X-QQ-Originating-IP: oPNXQuoDaU4Aj7Z5fp42tnUZkv/5G9GUdVH0MXc01R0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 15:58:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13107283811911453677
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 15:58:01 +0800
Message-Id: <DI5H97BVSHFW.1ICWSGU0NT7ZO@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring, and K3 SoC
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <afFtyCuA28042C3b@sirena.co.uk>
In-Reply-To: <afFtyCuA28042C3b@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NBjdfkqVynM2F4QRaOth2KqBMmd1NhAXORLMURSbx5JKwVTNiHfPN9r0
	3Nh2Y52iEj5mLLwnpbXH+MnOn5WosSzLty7qhXjMtvSorlvZFNWBfdvkKE6nLaeCqZ2ohp7
	sNWt9WwCFMMNc0M5YLnK5WPmbmEVKRG0jF0mj+Of0CEc0JZ2rgBtXtvL4NMZVttjFOMjB+F
	5fws+uprs2eSAPGuD/mCAd8801K+83+0n8pfUvQPk070avjtoOsqWw1Oi09CGJGOxFIyiRE
	OSY0M0T770iRuFzC1RLv68R0JKEd396CE7BYeAtcidAvEZEiX7ofwpgPtHvE1lheXdJLvA8
	Y0YKR8ROV+b/Uv/Vwa2STESq2sUVSSjZbKVQ5L0iIE0uNshlHzRM5kBTojw2SEDu31hh6Sn
	iBU754A77dc8wEdmetpuas8re14wnKyVHSOzvcc2HB8mQa6yH7Hh6yIXWxnLR473Oh3ZoBT
	mvn+NFK2WCMq6U2q2CXvAILUJARo5Xzgvc0rCKvZ4CLb3j31moQjlxgf5GB/hAR5m55mSR0
	Hv3Dl1/5ZWCQ7q5tsrK+ZdFQ2NfJcoh3uKTeIKSBO2+Ariz5K3eS+EvJeRDT+o9bMPAg/Bn
	S9cWBOEJ8AGXfxdKHhTOUFl/cUeNMHKDqtXQvWg+dmnQuyqJYO7L4+1TlHIOhuse+l/5NbD
	7Ve0foBseolTndUwDb0p/KnBmwX6xei6uykegQjFl7xhFRBaKFsdmiwpZU1wdsMO3RNKWaE
	irlCOngq3oRcPU+i32tXosytwlG8sk+eicGMDgIb5fgYVY0AsW5hzFvf2ACnrNaT8x/RbH0
	B0ZYvJ94fsld3WWEuZZJ4RnyFUFVRIlFtGlU3Z38G1uwnofrVGzngJ1Pb6JafkUzqOzLZ5Z
	u/s0jzuSUB1hIDKG1apAOAFXYJNuiQl6TmUXo8yHYFLEL2XT/EfcJhsyAxKcXWZBSi2DP1H
	UXS/HDsmDzsv4Ux/p/wmjiB2gVtDHrFKEn+wpC61l+jpD6G09L5qMLB+dhJNleQSVVEluXS
	qmWEhHTZYk+u20VOVpANbnAkyNa4HXyoT0Bw5Xm4N8eiautMKMUd+2PVgtl74VGQ5tx2WkY
	g==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Wed Apr 29, 2026 at 10:32 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:45AM +0800, Troy Mitchell wrote:
>> This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
>> controller driver (sound/soc/spacemit/).
>>=20
>> Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver=
:
>>   - Fix RX DMA params not being set when TX is already running
>>   - Move hw constraints from hw_params to startup where they belong
>>   - Adjust FIFO trigger threshold to half FIFO size for better DMA
>>     efficiency
>
> Just as a general thing there doesn't seem to be any textual overlap
> between the fixes and the new features, it makes life easier to split
> things up - the individual serieses are smaller and it's easier to avoid
> dependencies that cause issues getting the fixes applied.

Since patches 2/7 and 3/7 have already been applied, and 1/7 is a
small standalone fix, I'll send a v2 shortly as an independent series.

                                - Troy
