Received: from mout.mail.com (mout.mail.com [74.208.4.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250EE2236EE;
	Tue, 13 Jan 2026 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313432; cv=none; b=sSPST052NhVTtRY74ZUqPp7v5FjxFhEx8Gg3tNhwAs8EUEqxLlgCho0vwAj6ra7uFMwqNIuF4vrQAp/LuvTUfHhAW3F0z5fh+XDjjILQIbXqE04bVKlYRAv/0ZUYyuHJi2CcMuAiFAQXa1Emw3zRNumJ3LBPFJhxDrx+pTGp5lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313432; c=relaxed/simple;
	bh=dFHi52lkUuqctNuUfSObsTqURFmffNPxalKhjgDo1hk=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=lX+5n5dyvaGJ6GEVq+KH8PiDo23f9njy9FKXPm9qEb7bSdCCi3Sx9b3wi/YaAJIdSMd/WkUJ2nfMDcd95zB7M9t5Z3nE0KHDcandUGah1fpbtCuY7Pkes3b6nVreRBTQBVf+KqgURieTPoGo5sp/e260ILez84zmS8iXnvkntjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com; spf=pass smtp.mailfrom=mail.com; dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b=cXbC6JB5; arc=none smtp.client-ip=74.208.4.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b="cXbC6JB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1768313427; x=1768918227; i=fenugrec@mail.com;
	bh=dFHi52lkUuqctNuUfSObsTqURFmffNPxalKhjgDo1hk=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cXbC6JB5S5ZSTFk5wocoWsknGgw9nd47o1PwO4wwj7bP4UEGf8aC1+ueFyEXrZK+
	 lMycroJGwhGLqRNvScSpn5hZVTLNv1vgFMuuJ3HGrLKBQzzbevx6/WVgHbNTLePCN
	 L3d9JtezQJaW+Phz+25QRl1leMLjLQv4tFZ3D5qUkXG4Fu3b7T8iJN2AeHrPOwB77
	 A2hEUsw4/BRKSPFXSLfvxjne5kM0Gr73YzS3zw+/qaDEVf6SkPv1m+tOyjIk6naJZ
	 mIyDqqtGleQTVpaLhUJcl8L9i77imHHsMN5WTPDAWOdQaqSR4rR2Tzo6siZjwJw7B
	 DVQCBd6g1++oWos+RA==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [84.20.16.16] ([84.20.16.16]) by web-mail.mail.com
 (3c-app-mailcom-lxa14.server.lan [10.76.45.15]) (via HTTP); Tue, 13 Jan
 2026 15:10:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-7cd0b118-3320-451f-a47e-5e116864689b-1768313427203@3c-app-mailcom-lxa14>
From: fenugrec@mail.com
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 roy.vegard.ovesen@gmail.com, mickflemm@gmail.com
Subject: Re: [PATCH v2 0/2] ALSA: usb-audio: presonus s1810 minor cleanup
 and document
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 15:10:27 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <87ecntr9c5.wl-tiwai@suse.de>
References: <20260111-preso_clean1-v2-0-44b4e5129a75@mail.com>
 <87ecntr9c5.wl-tiwai@suse.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:egyroOusct5EiUVRrBBGuu6edzMS2+MLcXYDfRNTvkktcuwqvOamCrRXayCApV4LXh5iz
 teZ/31C35rSDoMbf+x3tsf7mBvT7RinxzQSwIakjtDBUuFnDNTp9SoXciV5mVBP8CycP0cvLX9H2
 x179Gi9j7jwdOBrwVBzizSfsnLjyBbnUEB+pHohooRQ6y7NT9vhx/nm/OazN1l1ONROyzd1Pq0po
 JO37NPiZRmypzjAHPirOTVbexTz9soF+/V1dAGaDVby+ZTdoQPGv65IjnoctDRYsjbH2j69oZpDd
 jw=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w1iYeUG3hGQ=;pFyAkmQCXufUAMp9VvW+9AozWiY
 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
 WbFkclRtOP
Content-Transfer-Encoding: quoted-printable

Hi,
=20
> The Signed-off-by line needs to be a real name (or a known identity)=20
> for legal reasons.

is it acceptable if I've been using this same identity since at least 2009=
:
https://sourceforge.net/p/freediag/gitrepo/ci/9314daac0cecda4e82b5e3e0de4d=
75fa62cffe93/=20

I can also PGP-sign (7F91B004A4E206EC) commits or sign-offs if that would =
be helpful?

Thanks !
