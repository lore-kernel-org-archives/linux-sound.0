Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27F29E115
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572641; cv=none; b=cGcM1JEqcZRz2i4+wwwA2mX4DyPOwuq58ehTGrNvuR78JRxs+6EEtrpwWWyC0+E9EjSy6FQF/L5IjdzzwDPxtOrD8VH6XOddiJ55EDgGenHSQssojjBQHalN5vef03QQ4cAEVUIr3BcxVCLGisbMoPOro0Cjml6e7zNu9VhXLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572641; c=relaxed/simple;
	bh=3dp0+RMMlwDmFucm27+70hXZuRLtiO+ybxj4FDbCw64=;
	h=From:Content-Type:Mime-Version:Subject:Date:In-Reply-To:Cc:
	 References:Message-Id; b=q0Adctgr3zIdwafoTsB4tY6lMlRk7kroR6tv9iTwHsi2DXO6AlSwdQhOB57Ajja89JzpjabuL/xln2nmNHCIBW+rIfoqMzrieVnnFCa6DT9WRdlKZJh2ej6aQIBqvqmE7bbelxMiMt5NIauwCpZt3Qxjsf3c51YkaqKMxrYjPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=o6iADCKW; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="o6iADCKW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Message-Id:References:Cc:In-Reply-To:Date:Subject:Mime-Version:
	Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rbpyIn1M/NGP8I0e7WDFK9Wt7lp+yFIT8LGl0L5yJqQ=; b=o6iADCKWkyxCT+eJ7hTfHQCG63
	ClRdYNzZg49mrf7aJrIAwOiB7/looQnlPzd+Lal1cyIs6c84M98asljIstlMitX3T94FUBe07EpC/
	f6viJ2RJwUYOMrWv0w8Yx2gWLEkKE3vSKtzwBH0naAgnP6/Jjg3+1TvQv8ioS2gt8ngxWTN9vkE6f
	sHhlgOzCo+4hRZeiWbFYxpFA1IobClXRxSLYIei0lQTgAZSlwbX8RIKJQTzYnMA/w6XJfcRpaM0g3
	HMozzC51WmPIsmWgzq1UCXWnOSagSwMZC2GEMtpsBJ5zR4dv31J8bygb6uHKZuYFXQQzwMieH0I/y
	4S4262DA==;
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] fixup realtek/alc288 headphone for MS Surface 2, 3 and
Date: Wed, 19 Nov 2025 18:17:14 +0100
In-Reply-To: <877bvmc9hx.wl-tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
 kailang@realtek.com
References: <20251116.162633.1272923634893984527.rene@exactco.de>
 <87ikf8fx70.wl-tiwai@suse.de>
 <20251117.210734.507304067570791021.rene@exactco.de>
 <87a50icaxv.wl-tiwai@suse.de> <877bvmc9hx.wl-tiwai@suse.de>
Message-Id: <3D155CBD-5517-480B-AB15-22DDAA5EF282@exactco.de>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

Hi,

> On 19. Nov 2025, at 16:44, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Wed, 19 Nov 2025 16:13:32 +0100,
> Takashi Iwai wrote:
>>=20
>> On Mon, 17 Nov 2025 21:07:34 +0100,
>> Ren=C3=A9 Rebe wrote:
>>>=20
>>> On Mon, 17 Nov 2025 17:20:03 +0100, Takashi Iwai <tiwai@suse.de> =
wrote:
>>>=20
>>>> On Sun, 16 Nov 2025 16:26:33 +0100,
>>>> Ren=C3=A9 Rebe wrote:
>>>>>=20
>>>>> The Surface Pro 2 and 3 have a strage frequency response and miss =
most
>>>>> of the bass. I discovered connecting the HP out to the main DAC =
fixes
>>>>> this.  Maybe the other is mono or whatever strangely mixed signal =
for
>>>>> the built-in speakers?
>>>>>=20
>>>>> I later noticed the Lenovo Ideapad 720S (AMD) exhibited the same
>>>>> problem, so this may be a more wide-spread general bug w/ Realtek
>>>>> codecs and the hda_auto_parser, ...
>>>>=20
>>>> Usually in a case like this, we provide a fixed wiring by a static =
DAC
>>>> table, or do some other tricks instead of directly writing a verb.
>>>>=20
>>>> Could you give the alsa-info.sh outputs from those?
>>>=20
>>> Sure, here is an slightly older 6.16 kernel I had at hand that did =
had
>>> my fixes applied:
>>=20
>> Thanks.  Could you give the output from the unpatched kernel, too?
>> Just to make sure.


Sorry, typo, I already had booted an old kernel without the patch.

> ... and if the purpose is to just swap DAC assignments between the
> headphone and the speaker pins, a patch like below could work better.
> (The entry is=20

Something missing? But no worries I will try it out and swap entries if
needed and send a final patch.

Thanks,
	Ren=C3=A9

> Takashi


--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe

