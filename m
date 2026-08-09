Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A91F8755
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786297275; cv=none; b=NmDBIHPrOig3OyRDxySaXe5d6NFVmFZNm1BowegyJ4C9z0xtzbH8fSPuKfYJAHVNdG1Q/McmzwkK4NTMpQoK9k5hMcjRFFjhSua4VE1Qcf4Lg4e+Bw2IN0ksrqm/EYtWqH3yjwDvxJzQcKPdGFpAapkLfhzscFG9bPjWLTPkHOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786297275; c=relaxed/simple;
	bh=wgRHakZQ/kxc91O0ulgQ9CYuvB2NKywPyTBblMzjuxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AF+ad57fBfFMCQiVZaWWN7vW6bQTxMjW1nmrarxQ0yPzKBxRoJDR1AfkTjGhSG85qzaJwZRQx735S1myTPsa5PulJ4KgVbN4v6bm6Sl7UC2/bJNd7u+2nM/a3sSiUOH8HkLfs7fv0c01RnuPrXa5r8ssszjiuDz1QjHK8P4Giwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=ckcMRoXk; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="ckcMRoXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786297268; x=1786556468;
	bh=UTvm7XHzLTZ/f/42xF1+UsOaoVbBj93qlOo1rD3x7xQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ckcMRoXkuZWSczSrzk3SXTiOwU5hF6fJQCXhTxta9/uVR5V1FHgqBsB3IUGTmQkR5
	 WpgVDQRzm0Vvo/EJxJQONzHeRDdBdMc35ujIGmkeP9zvGhhN3YcqlgUnA+Kw18/cV6
	 jVDZVxe0XXlA0BvWVh86maInUjQ2mhtC3I48VOCvpTjIZocW1dTvOhe8kHIDch93hn
	 Q3OUm3xQMQ15ncw5u2aomxqc+5kcDLcFJf1JnXaX7RDxUzMS10ur4rRGnS4x+9JD4h
	 KjawB0s2DbC76IitoWZXyKCQGi3UhQUO3dPVZO1hbXuRZTLnv4v0kwv9SHbg1hWRjd
	 sMooNwh7g5hiQ==
Date: Sun, 09 Aug 2026 17:41:05 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: tas2783: let regmap-sdw-mbq poll for deferred transactions
Message-ID: <51a70023-9eaf-4d50-8b87-60fdb73cf08a@saarinenkoti.fi>
In-Reply-To: <413bdfd6-e0b6-4a64-9e60-cfe25ac684be@linux.dev>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi> <20260809101541.4969-2-wiza@saarinenkoti.fi> <413bdfd6-e0b6-4a64-9e60-cfe25ac684be@linux.dev>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: eaebe8de1bf82c90fb8e4799e988fd25b485fcbc
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bossart,

Thanks for taking the time to review this. I am a bit of a kernel noob,=20
but I completely agree with you and the spec: FUNCTION_STATUS cannot be=20
deferred.

I think my commit message caused a misunderstanding. The patch doesn't=20
defer the status read:

The hardware is actually returning COMMAND_IGNORED for the UDMPU23=20
Cluster Index write, which is the only control tas2783_sdca_deferrable()=20
flags as true.

I only added FUNCTION_STATUS to mbq_size to expose it to ->=20
readable_reg(). Without that, regmap_sdw_mbq_poll_busy() considers the=20
status register unreadable, skips checking the busy bit for the deferred=20
UDMPU23 write, and instantly fails.

My main goal was just getting audio working on my personal laptop, which=20
is now resolved on my end. I will leave it at this and leave it to you=20
to proceed, adapt, or handle the changes however you see fit.

Thanks again for your time,

Ville

On 8/9/26 17:05, Pierre-Louis Bossart wrote:
> On 8/9/26 12:16, Ville Saarinen wrote:
>> In SDCA, a Function answering COMMAND_IGNORED to a Control write has
>> deferred the transaction rather than rejected it. regmap_sdw_mbq_write()
>> handles that by calling regmap_sdw_mbq_poll_busy(), which waits for the
>> Entity-0 Function Busy bit to clear and then retries once. Neither half
>> of that works for this codec:
>>
>>   - poll_busy only polls if ->readable_reg() accepts the Entity-0 Functi=
on
>>     Status address. tas2783_readable_register() answers out of
>>     tas2783_sdca_mbq_size(), which has no case for that address, so the
>>     poll is skipped and the core falls through to a bare
>>     fsleep(cfg.timeout_us).
>>
>>   - tas2783_mbq_cfg sets only .mbq_size, so timeout_us and retry_us are
>>     both 0. The fallback wait is fsleep(0) and the retry is therefore
>>     instantaneous.
>>
>> Every deferred write consequently fails by construction, returning
>> -ENODATA and logging "Defer on undeferrable control".
>>
>> Add the Function Status register to the mbq size table so the poll can
>> run, and to the volatile table so a later regcache_sync() never writes
>> back to a status register. Mark the UDMPU23 Cluster Index deferrable and
>> give the mbq cfg a poll interval and a deadline.
>>
>> Note the two cfg fields reach read_poll_timeout() as (sleep_us,
>> timeout_us), i.e. .timeout_us is the poll interval and .retry_us the
>> overall deadline -- the reverse of the kerneldoc on struct
>> regmap_sdw_mbq_cfg. The values here follow the code, which is what runs.
>>
>> Developed with AI assistance. The assistant traced the -ENODATA into
>> regmap_sdw_mbq_poll_busy() and drafted the fix.
>>
>> All hardware measurements quoted above were run by the submitter on the
>> affected machine. The submitter has reviewed the change, understands it
>> and takes responsibility for it.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Ville Saarinen <wiza@saarinenkoti.fi>
>> ---
>>   sound/soc/codecs/tas2783-sdw.c | 37 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-s=
dw.c
>> index 3d0b11654..5a7ac6224 100644
>> --- a/sound/soc/codecs/tas2783-sdw.c
>> +++ b/sound/soc/codecs/tas2783-sdw.c
>> @@ -423,6 +423,13 @@ static int tas2783_sdca_mbq_size(struct device *dev=
, u32 reg)
>>   =09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x01, 0):
>>   =09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x01, 1):
>>   =09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT25, 0x04, 0):
>> +=09/*
>> +=09 * Entity 0 Function Status. regmap_sdw_mbq_poll_busy() only polls t=
he
>> +=09 * Function Busy bit if ->readable_reg() accepts this address; witho=
ut
>> +=09 * it the core drops into a bare fsleep(cfg.timeout_us) and, with th=
at
>> +=09 * left at 0, retries a deferred transaction instantly and fails.
>> +=09 */
>> +=09case SDW_SDCA_CTL(1, 0, SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0):
>>   =09=09return 1;
> I don't think this is correct, sorry.
>
> This point has been discussed quite extensively in the SDCA group and
> the net result is that accesses to the FUNCTION_STATUS *cannot* be
> deferred. You cannot e.g. get a COMMAND_IGNORED response that would set
> the Function_Busy bit while trying to read the Function_Busy bit...
>
> Put differently, deferred access is only permitted in specific cases,
> and Function-level controls/status are not in that list.
>
> See 10.2.8.1 Rules About Which SDCA Resources Can and Cannot Use
> Deferred Access
>

