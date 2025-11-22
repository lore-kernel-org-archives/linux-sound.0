Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A535977;
	Sat, 22 Nov 2025 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763838236; cv=none; b=WuqbT5wUaSFsMvgZPxrVps/RpNnvMVM/S6qegwTzunRdUYGbznQ/w26H+yqLBbsoqzOxEX+bfHVDzEPoFoVEkhQfbhejecXTPnraChOj5tzNrVt4e8PzrqtmDDC8BRc0O3FhtTBPeD4bPG/2XhCHKumGsWA/FUAn8MUENFly+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763838236; c=relaxed/simple;
	bh=Cd9GhDs34v65oTMv/vI2NOFXJgHuZjkrOtKYd/B2vuE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=aEQptowIKomx2K4gvOuJfR5rOJ+quXIwHigCyz6IWsdh/Z2u1I24Rv78u0i2NoKlSa9xMUvLnWmPQzvLzunazDhKqcUXpC7w1NxmSwKBadoSLiz75s08fFV7es3gzGwGXYk9yjuc0JbGW31qSPigOLkgfE4M1MWooOCTXmcxbDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=f/k9Uo6o; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="f/k9Uo6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763838225; x=1764443025; i=markus.elfring@web.de;
	bh=d3C0Sn5xai/Sc0VsBcNFfvJTTXPz9Qs7+DPVmrUgBac=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=f/k9Uo6o9vxiI0TmChkq4lWRvrfp5KpwY3E7xDnJWnrQsJx1rYsHIDAy9t8FMkoG
	 9pP40xrAaV+6jSV77HCt8ROZ9DeCZkX7Qlnj7YOw62k6GXmTaRj8/n0rFBVw5UvN0
	 a1995ryNbUmGMLGrCD5lHLRjRRyKMVuZ012rqnrGP4vZDBzupfWvx8NauSdGfjaBF
	 Hul7VheJjBhMRkGdPLMJmakRikLBeQibbvwahj90CnQ4QIG2KL6r0GKsccnHitjL7
	 U9C8EuEjUYz9nRhLkkGyj4iGMtgfO0B9tY7d8IRmUusOi5qDLuClTIUbllBKp8ivu
	 aCzXcZ/30kFVGUN7Ew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.246]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJnrh-1vh19E0GfR-00Ul68; Sat, 22
 Nov 2025 20:03:45 +0100
Message-ID: <7392a065-bfc5-4dfa-89ac-a7ac94a587d9@web.de>
Date: Sat, 22 Nov 2025 20:03:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-sound@vger.kernel.org
Cc: lkp@intel.com, LKML <linux-kernel@vger.kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Dmitry Baryshkov <lumag@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Takashi Iwai <tiwai@suse.com>
References: <176376310618.101329.9975086867710479356.b4-ty@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: add explicit soundwire depenency
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <176376310618.101329.9975086867710479356.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:caM1cJSaMEDmNjijjQyrCsNCUidKf2vtQUMu3isFMwKJRrkFObR
 yj7FBIEV8zAyyvK0Sde/smUGsOc8ooMF/QX4AsgZHEC7XeL+HZHDSJPQ2QHFtC1mo0xmsc7
 uS1z3027rxXrT0C9nxQquqfiwW9qH16RKkz2R6og++gPBjeI4DhZqATRtEy2CZ9wHm1m3GT
 iGVTOBMyUIr0HonC5b4AQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hfmCxEeqfB4=;EaHnPWCSB12wBpugIEmrprGfN2i
 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

> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for=
-next
>=20
> Thanks!
>=20
> [1/1] ASoC: codecs: wcd934x: add explicit soundwire depenency
>       commit: a3d8f733d453ed4d4eb1f0e894eec787777465a2
>=20
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.

Would any contributors care more to avoid a typo in the summary phrase?

Regards,
Markus
