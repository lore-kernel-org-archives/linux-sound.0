Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899435C1B6;
	Wed, 29 Apr 2026 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449843; cv=none; b=ontFeKvo20SggGcUR7DY8bxjFddKqQ0AHYmkklBCd97rCYxWb2yrr2gm63SZyvDK2/gCTzpJC1PK/28KgWRE8P1LvEgxitILaJpvkyXqudy+grOGTu6DiQJFPnJbz2Pueba5MLNPg/p+V3btP3Dmie+4LH6B/TIK17mVR+kNMRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449843; c=relaxed/simple;
	bh=dX7QsEGz4VtKbIHdSeXLo6QP+Ue7Cyb5IAqSUgvZDPU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OllN18CXcv+XHlXF5YGGaf/rI01JwmZUdNv1V5xMJG0JTa+uf5hw366GnGx9z1MzwnoWYmLECv7N5rAZ3c1qB80T84P0aqr32KK9H8fZGg1VS9DBhbKnVndxyzzB2R+aU1PxOiyZD3C0Jic21GxLMrZFCHqD8pH8shDRocEVgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UHuxi3Eg; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UHuxi3Eg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449833;
	bh=5fUuBfC7bwv1lJmKApj9TAOEI13YVB4KodPqQkdcyHw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=UHuxi3EgviWKmwfjSBodUN7+cH/Cp51DYzO3SWEjymHu5I6Z23faTNMD+7ACQbbUU
	 gYYU0IiLcGSOWNZr4Mep5FtwU86JrL7I9pdJhy+8B880R6/UFTiTbdJmOz9gKMMegQ
	 dtkMSV8MQ/O6KQmx+7DnCmYcAsnZWvCmLGcmE5sE=
X-QQ-mid: zesmtpgz3t1777449827t5d1bd17e
X-QQ-Originating-IP: rX94L3y+/0mK+XkUrL28TUJzyamFByYqjc5ZNvM/9pc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 16:03:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15618526834681889661
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 16:03:46 +0800
Message-Id: <DI5HDLS7LRAX.3M0H0KH046K04@linux.spacemit.com>
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
 <afFuXO3IfV6CSsLf@sirena.co.uk>
In-Reply-To: <afFuXO3IfV6CSsLf@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NVJ59BI8BGh+BFPWtIceeGCRduANYadvAz0ipfnrQ0VYK/UmUTH9ek2F
	wb0eWitfQrgv6Ffv3h39eb+EkB9rm3VccJ3RcDjdn6Kk0ZmsI5MtVfoYJFEz50CTNwgxa2F
	gUqFx1mTu2Vz1HjbYJv/U+AS+wi4N4UbqxCECATmfAdiVgcAdUorVc+uS2Dm/+2olnUuE3g
	DyoPU2UDpSMcQD+ndM+iTUOdItbwY2q3WQS0hnT2cn/giO46hFxauypiTnH+0xbULGlDlHv
	E4WDpX5uBTGCQALiPivh9Friq+CSZ/b+1emW3H4VSAH3aiDyi0viBm06tyGL/mJIFg5Qnf5
	3qZykKl1PVEz5UDNjM+mvPjY3sRrlE0zHAgd62Cf/8WW757fZVuhyNg0GClx0xd3zhdNyBp
	CnC9JDB1xu+ofAvOCmqFLxnyRP6VaIRq9lF4WeLm6ppmW7cT3ZStblMFUtYs0v8Ly9Ssho/
	mqZMBv7m7zbmeQivXd0vknBZEmAK5MtPmQG/XPbxpegVZAHrAXn4bW7nJeq7IWXyHOtjcQN
	oDe/YzOTQvS+hfA4Vc0ytf5YE68J+eTPa01IVggp55vj9azUl6xWiqvG4Ym2fzYVAfT4r4Z
	0Iy0GQXLUp7W5AR5mfHrYdjYg1/oO/S1H2ZxZ1dNyu/LVz0QsUweesFyxnKNMoP3ut38P5l
	sATcCNGR2GRBH+K92mKmx3yHGHh2nX1Be40AbKIqbLbomzFiQKPJwMpk+59H05PSZedMkQL
	3fmDW1QoRhYAEQdbZADBjnQXMC7v5vl3UwRMfvBLdKtWaOOikKZ32yujjNpIYTIl7C+wbj9
	P1D5yBr1cYbj8yyrYQmlA9wiHjtqL/dwSU/duHN9LzVw0ivI4ubbsdSyXJi2jIHmYoDOmKR
	i0M51cy3eIcGVLsBA115PaKftxaSrtS78wLFYfzZ1bL0zwlvL+pPCLQGBHxTHe2D/UZNM6E
	/9Cg9i6Tj7hnxWcWZIQR7Zs9bNO06jTzRprljp4pW4CVcGlA+ozKDLMYX/ZURuYTFfJLx6r
	ltp2d4+MYOrdiX8s2ifvRbYbNN49YOhISQNBfIGQYQlkX42KIiWdIyUVUHyixkmDTQvWKJC
	GuPEYihJfz4
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Wed Apr 29, 2026 at 10:35 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:
>
>> Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 SoC")
>
> 	Fixes tag: Fixes: 955f7b46873e ("ASoC: spacemit: add i2s support for K1 =
SoC")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
should be fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")

                          - Troy

