Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689835E1D5
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 21:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786569527; cv=none; b=eimuONEk1Zxk3ul93JjL86FeKLoKOxekhkzfCllv1114H9aJW4xl0CvYgnjXq6J+Uy4Ca0oTxl7XcZsFgikPpAyn9XTKFr4/ihingnl7degTXvBom4cPYLi8AUUNX2AQaXJe9pa5Uo0mNHM1lus9cc52AYqAEeZjF0YIsNOD2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786569527; c=relaxed/simple;
	bh=ctf1nUhNLVNfjin7UMuWE2apYrA21BEiihmS9guDswE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TP4mZm6sDReP+QsKBwSFSaYXnQUihUaYVaJnj97S6V3LECVfJlt2KjrEN1jrFMwWbRgWMSsM5B4EgwLO0pg+D9K65n6PsBIF5//WvUKTvJumFq6YsHEEjFZzc6G868d78C+jwQ8f4i2qA1J7Lm0BLgTVbS3njghw5VG/AQf1CEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=rS3tDJnt; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="rS3tDJnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786569508; x=1786828708;
	bh=ctf1nUhNLVNfjin7UMuWE2apYrA21BEiihmS9guDswE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rS3tDJntUhjHJ5pEEU6xWx9G7cuR5wiwSZTEj3MKx8Rc17S9J0U0wo6AA4EUaKz4U
	 TrCerUp/51FV9sa11zZSgDtcsTuJK0kodcNg++wzDIugYR+PzOlMWIHRPaKLLuJyxJ
	 QTC6gxk0m2h2krAtBgXGwwc3Ug24YnCvVreUpghS8GqnBlzI7vWVhJQasWdgYIZwlh
	 72/n1VhPYt+E9WeDLMImD/OLyQp1G/RUF7QhsjV9wLDKE7y0v0vc9HiKB8xOSoIRGz
	 dkZtF5jt2S6emgGG+Xbee7trsNxURM4oMRG09KOlpE35papw8UzC3l81rPLvCJ+1rf
	 cALgG/SLJH05A==
Date: Wed, 12 Aug 2026 21:18:23 +0000
To: Mark Brown <broonie@kernel.org>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Ville Saarinen <wiza@saarinenkoti.fi>
Subject: Re: [PATCH 3/3] ASoC: tas2783: drop firmware-owned registers from the regmap cache
Message-ID: <20260812211807.59906-1-wiza@saarinenkoti.fi>
In-Reply-To: <0de8a9a0-1929-4210-92dd-2376550fd841@sirena.org.uk>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi> <20260809101541.4969-4-wiza@saarinenkoti.fi> <0de8a9a0-1929-4210-92dd-2376550fd841@sirena.org.uk>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: 1e63139ce91125a6460d283be264142145a4081e
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you for the time on this.

Context you may not have seen: I withdrew this series on 11 August, in
<20260811135539.8672-1-wiza@saarinenkoti.fi>, so none of what follows is
an argument for the patch. It is just the answers, in case they save
somebody a day. No credit or attribution is wanted for any of it -- take,
adapt or drop it as suits.

The numbers below come from the image this laptop loads,
ti/audio/tas2783/8EA1-0-0-0x9.bin.zst, parsed with the driver's own
header layout: 52 files, 39606 distinct destination addresses.

> Are there any controls with values that come from the firmware,

Both of them. The driver registers two, "Amp Volume" at
TAS2783_AMP_LEVEL (0x800003) and "Speaker Volume" at TAS2783_DVC_LVL
(0x80001a). File 19 of the image writes 8 bytes at 0x800003 and file 24
writes 4 bytes at 0x80001a, so both control registers are firmware
owned, and one of them disagrees with the cache: the image puts 0x12
there, an Amp Volume of 9 out of 20, where tas2783_reg_default[] holds
0x28, which is 20.

It is not confined to the controls. 69 of the 70 reg_defaults entries
fall inside a range this image writes -- only 0x800021 does not -- and
23 of those get a value different from the table. So the cache and the
device disagree from the moment the download finishes, suspend or no
suspend.

> and shouldn't we do this before rather than after the firmware
> download?

Yes, before is better, and I have no defence for after. The loop breaks
on a failed write, so doing it afterwards leaves the cache asserting
defaults over a range that may already be partly overwritten, and
tas2783_fw_ready() is an async callback, so a control read can race the
download and pick up a stale cached value. Nothing about it requires
the drop to come second.

> I think a more robust fix is probably a combination of writing the
> firmware values into the cache and marking registers that get
> programmed by firmware download but should never be cached for
> whatever reason as volatile.

The volatile half fits this part well. The caching half is where the
image is awkward: nearly all of those 39606 addresses are DSP memory.
File 0 is 32632 bytes at 0x00c60088, which is PRAM_ADDR_START, and file
1 is 6904 bytes at 0x800108, which is YRAM_ADDR_START. Neither is a
readable register by the driver's own definition, since
tas2783_sdca_mbq_size() returns 0 outside 0x800000-0x803fff and
0x807e80-0x807eff and readable_reg is mbq_size > 0; and the regmap sets
use_single_write, so caching them would turn one bulk
sdw_nwrite_no_pm() into a byte-at-a-time replay of the whole image on
every regcache_sync().

Split the way you describe -- the page 0 config block cached, the two
RAM ranges volatile -- it does look like the right shape for this
device. One consequence worth flagging to whoever writes it: if the
page 0 registers end up volatile rather than cached, almost the entire
reg_defaults table is dead and should go with them.

As with the series itself: the analysis above was done with AI
assistance (Claude Opus 5). The image figures are from the shipped
binary and the driver source, so they are checkable from both.

Ville

