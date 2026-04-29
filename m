Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3403A3803;
	Wed, 29 Apr 2026 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449420; cv=none; b=OT8DAyzzl8wS8jm5z3r/0ryQqnEechSf21RJfU5NGILFbLAZlMQ/9XV3xDAW6O7ZJ92s1bY7yP6AAmt107SVCZko42XKfh12Krb+m0JyXg2Ji8TsMoKf3Ppyua2poxQ3j+qEjM8w5kTkXuqAzboyn2KyslqD3vuBiqdq5R7I/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449420; c=relaxed/simple;
	bh=UPeTgm4C/Ie1ap4dTBAYXimQGkzcmNYfJQ4v7B4RFro=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DxFXX7hV2UwZMJOPJzGNuSIj2sPzLGVETWJjjiaY3Zt/ALME2TSMTwwE7up3VDhcGgLJNLPSkOox9EzDXmEQnVr6z321evnVYjholhp2PSO40miMDwddf2gsGqMMoY2yAnh+QJCMuC/MJhOSLrtUhbGuP/vYszokcK9pPbDxAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kQNXRN/I; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kQNXRN/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449414;
	bh=BJ49DOwjJR+WskeXhiKnY23XN8YKPK13S13MmrbKwMI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=kQNXRN/IBDbv7FceeksGeddoCJ5S6RRx/7CXTo3qtnL9m6Gk6p8jsXR1EsdVzp3xA
	 gzcailOB8TuWyZ5BrhyqP2MFvD61b9F3WMLj81nzqBvZwIJrCwSK95DuLlMnO8HXIO
	 G4/lQ53eTtultmndYT+JaaERSN23Dtir/AOnpixw=
X-QQ-mid: esmtpgz16t1777449409tac12cdb6
X-QQ-Originating-IP: DkWHvUEwJTe71CZ7AGA68Q4lc/p1h5yY4D/tlreyZvA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 15:56:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 729058513551534686
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 15:56:47 +0800
Message-Id: <DI5H899DW2NZ.P89S1L5KSOO9@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX
 is running
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
 <afFsyiSHrVBapQ9V@sirena.co.uk>
In-Reply-To: <afFsyiSHrVBapQ9V@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OGtyjy/q1OVdeFO5A4VzZQuGXBoI729vD6r0cahmaD7JzTX2IoVRHh6b
	YH158zWFy7AaY0G3Iy9YA5Yt9KW/XYbsVhRxG4dgZBQTlrNMPj0iPsbmF4iEztmcTWREoV8
	jSk6nIsimoGB53sjltFDSfUMzZIFt1JfE/c1G+RC3+537h10Qtg+5n65ZkByyEuW+Gn7IOw
	VvSGc/S19Evwt5dK31bZU8lxmLIsB2mxZcG73raKBdvqbLGcAiXR6btyljCvyrIL+GYZfNf
	09qja6bBDm3ISbYR07TAqbUTlMKkMDKLw8B5J+sT+rnnxvajJwYfeIN5frM+P+3od15H+UF
	SOHZcZ6jb5/lKiDcv2GvqQp8ixMVPK2NoYFFQ/D9Iq0CnyrAuwCGpGZikFKwoU+IL3nF9dI
	Hc9f45K7RF1inUjZsv5eDFGIZVA6UjxU98GctVjoYlhXPmotE0VZitUhxvoXyw0wzL3C3AL
	xbcHub8ivjXKuBPdEDnqfiU64bMcw5BCNq+N9U0BrlymtXyVDFgwpus8K/x/7+FoTSx9wCr
	tZclEYMMfn1k7czhdEcDl2U6mnmmwEbLClX7g5Cb5g4gXXBxU3u6B0iaKad+kIpVdr+2lcu
	7g3eLfzxQemiRqVI4G04xeuUnpIJXAr2fW6BbBB0pWHtCNnsvG//B3rtMVWlaUjqT7Y9kiI
	+pvctZngzrZAjEzMKSOqom4salbzJ3orCaZqhVq3VFqkv5np0fmXOwPHkrxSdBLMNDmIt6h
	ckgGIUiSRGiVk5g8P0LnxF6p25lQTXDJ/KV5if99cpfAXVBEQKuXm4hXBpqlh2B6QLDItts
	7b5jXmVjEObBfzUebbQVjUANo73qw7m2oy3/YX4lrv/2gTezL++4cBghWJEcI4IfWBHEfg4
	BMQtX8qhILnOEOfQHPPe2csM2vvCNa3fa+yY0flauMt1ZntISBQ7C72W5KEO6mhDmRVlBMH
	AcoOAd8cnBvZxsz2/EN7XU4mqQS5rgMl5rwvobMlV6wHTmTAXW1F+ca9Kb0/Zep0+Do919b
	C+OHkEoriFZTKBGdn6qdwQHCr3tuu3eGEwiYSsD7XC/cqUay7mC4+o7Io4RdWFf1sTZqq4R
	ZOCvLwgREvts2Dlrtdm9oFT+O2JF/FftA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Wed Apr 29, 2026 at 10:28 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:
>
>> +	val =3D readl(i2s->base + SSCR);
>> +	if (val & SSCR_SSE)
>> +		return 0;
>> +
>>  	val =3D readl(i2s->base + SSCR);
>>  	val &=3D ~SSCR_DW_32BYTE;
>>  	val |=3D data_width;
>
> Very minor optimisation but those two SSCR reads could be combined.
Thanks. I'll fix it.

                   - Troy

