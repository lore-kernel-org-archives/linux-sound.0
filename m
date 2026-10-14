Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E927FB1C
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011982; cv=none; b=fbCRV06v94t1zZs25T5/n4BQj+iJ0NAGVznj1gCXU7nZPLeTcBMTDL65RnSKmwpPGQ48kppdnlpNL8iPzsOJp07KhI917bR291HEaR11KJA7PaN3Hngd+7rlcyBIuVcqQCRcXWNSsY6duLq4M0R/+Ejm7UKeTKeZ18+D8Bc440M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011982; c=relaxed/simple;
	bh=zKV/h5ggzLPBAdDfH6zEONCJqwk0aOQae/cQF0E+tF4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=moXIDVCtsUFTFjj3mKh8YfYRtq1w4Wx5+qqq1TbSGPcfcmaki6MXz4opuC6QgpWZyNDfX4IuIVOamAW8WmlhrF9bHmGRUwB6sDF5smusiGBvm/CBwMkNj3PC0qVSNxdq6qcIwtjB5wmLAG6ACFAuTUiYZ9GYS4Iiu64YA/Qfxzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thefabio.com; spf=pass smtp.mailfrom=thefabio.com; dkim=pass (2048-bit key) header.d=thefabio.com header.i=@thefabio.com header.b=XZ1xZxpF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qQy7JyTM; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thefabio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thefabio.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thefabio.com header.i=@thefabio.com header.b="XZ1xZxpF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qQy7JyTM"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 202911D000DA
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:06:20 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-06.internal (MEProxy); Wed, 14 Oct 2026 17:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thefabio.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1792011979;
	 x=1792098379; bh=/z1WM55INY/Iucfr6nAbC8MJRfAZQJc+qd8f/G+1Gk0=; b=
	XZ1xZxpFx8bJcScAbspjBIjic2nYLtWD4QFXJ96AAV8pb7D0brNeSrTleyQ/nbne
	4ERFw1BY8h+w9hZZIrVf2ut9SjR3mF5C8Xw/PXY3/NhQEPvJpQ3i3nLFuy1A/UQW
	WMXPm+HEvk+q8IVnoVzjNCL+uA5ECrsTefg0VLibcUiE/qTm/fskmAXw1V+3wG8A
	uNmvT2b96sOnpBE4GvEslhm7rAVQZqAw57UD8w2toWnAWXu0vV3qHQ4EvE7k6Ags
	i+hIbUx6zdRpyq7Vmn1qBSCk8L2foiL2Ywcjbk/0lOhFHZyGrf+BoE1neNnf0xmY
	PW+eDKNFZucHV4j0GXYsmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792011979; x=
	1792098379; bh=/z1WM55INY/Iucfr6nAbC8MJRfAZQJc+qd8f/G+1Gk0=; b=q
	Qy7JyTM3BpPIoicuwJu2DXKqQrs9pLaACAjXdMmEu9JKMTlRtOFzhCJS93jnIIva
	+CCv0q9GDLUiEvcxa4+N4TlgSZRsgbSk0Rdm/C7Ynp8I3Sg1jQkW6VXcV0hrUxNX
	fYlhNNUSiKN6lzaWEJtGBWGLNoAnzpWv5PU4If19yblRThFV2yCkLVWvO/k4jNSB
	nzy4CnZATbSQaV/n/x0PD5w+ReSQc5OojUp21kAzOl1rE/5LjK0Vvt56UJ9uwn8n
	98ala0wTe/YRsTs8bZeAAq/BynkH3iEdLZ6ZQS0u9Rq2eRGIeO8A5gdmACV34skM
	RrwncXVi+MJpt81TvjhSA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=thefabio.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792011979; d=thefabio.com;
	mf=PGNvbnRhY3RAdGhlZmFiaW8uY29tPg==;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:VCPrv4yOvmjYZDuKskskE+MYO9k6KYJFCGUHTTMM0wOXOUN
	Z77RcX2gPKNA5V8meckgPhYrDZ06I+UVGqTVi0O+4rIbp06GRRPlSs6DSnVkon/C
	gxS9hSATQ4PkFnfZoxe58ZL41GlmFt9hMM3mZmARlU/0pvhFZ/JcBwHJk3vAAaJ9
	MwldSSmtFSeED5RTzReQcNmj7exAFGfh9fxJIpHPfk9vYy9bhTbW4I6oXycqHg19
	sfEve8VGe/pJokZiSCirBNEjZpTQrmWtZCKDtGx7O3QMwa4/+f9OIRhag1Tz9L3I
	1Zhf4JVntDoJbJUD269DUhR7W6G5hfcwK3ftZjg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:dLXzli/MUu/x01p0ubv0XtmeLs3oEftu00uXQvy7vhY=:zKV/h5ggzLPBAdDfH6zEONCJqwk0aOQae/cQF0E+tF4=;
X-ME-Sender: <xms:ye7Palv3_EIWzsVzaGedLpogfpIjUnFJLy-ytCoMGPEb_fk0q_irHA>
    <xme:ye7PapTnY5kEqKSpH4CrJVrwQJuGlZv1y6BQA6YRwRWOtyn2JvlL9fQN9ZIooAPL8
    QnwRn9gOR4BsEwGPmXUqlFH1vFbvWneeEFxXA8KLCW1p2Cvl9CDaF8>
X-ME-Proxy-Cause: dmFkZTF8/82XYRSIsmmNr1rlIqzNru5JQhemuR5hGjJcO4jIP8MsPq7kuoLL71uoSI8jmz
    VHIoPmbv7HO9qAVBJ8N0YjzG4Ng7zXEj/yMvWctGZJlV6PaZa88rJAHRXSkMgAFom1+M4Z
    /HYYlX+kHAVifcbQY8L+7ffayHykGTe0RKmzy1kj4IygxBAJ11/+nbEt/zhrwA4cifPNJ+
    OMmrMp2oOcXfCmQzWoZM4/+TQjpzWuUKzF4XsKH39akS8dxTEnkCD/tJ/U3lPrS7PZTZgC
    W0gC4JAb2hcZ85EmD7jWgaIWhe664mwSzW10EngKiHJIvFcEHt7ToDGp0PeatSkBRvM6WS
    6kS/BffwSdQ1MQ9BZr+oF2D83foTkQeseWhpL668I3d8F/6osyO+bWf80C2ZieUKyLMa9M
    LVYWJpmZGfptOXUv/LehYPgfGxqJuiiCaV40a3Nol0B+qlD2IUv/YAbtATu5hXMt09Dyxr
    bPr7H8wpJmc+gx1Gn+bMWXO/DBGKx3/DOYvhfA1xVy935+EqLuAMDl063WR1+9P1uFaDqI
    PwAqnUMx1anqAHgly15gVCtuqgyO7FLk6v2ceQHvoeMSXoxqg4g5U8IywfckZS6RMzdMGu
    o4NiASqGhyATO6C4drT+sjUnECnlQa0LpkfJPfXhVZTfWQ0orkP+X3FFuj+Q
X-ME-Proxy: <xmx:ye7ParQ38MswSmPbo1mIsPSa_4BsNLne9V4g7OpgT2qKi5WXuTykfw>
    <xmx:ye7Par1qrKfTsv6hJ0Fu0oJxDQwMDCYmWODKErA-TXrDMsStF9Py0A>
    <xmx:ye7PanD-Fyy_9cuRq7-vzi4-rPtoWzZgnQOQP88k9kAw7efCL2VAuQ>
    <xmx:ye7PangT-XhjB1MYIyqZKe8UbDO6AggeAWgk7dLWiY157eYrHjJRlg>
    <xmx:y-7PanNwGqneWLlz_oF9EPI0anIEf8ljVE1VtJty4mo0X6IFi4Cucilz>
Feedback-ID: i95764ab5:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B53781EA006B; Wed, 14 Oct 2026 17:06:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8Xsb6O8qrnR
Date: Thu, 15 Oct 2026 08:05:56 +1100
From: "Fabio Lima" <contact@thefabio.com>
To: "Liao, Bard" <bard.liao@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Cc: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Takashi Iwai" <tiwai@suse.de>, "Mark Brown" <broonie@kernel.org>
Message-Id: <117656b2-d284-42f9-92e1-6fda59fdf581@app.fastmail.com>
In-Reply-To: 
 <SJ2PR11MB842439739B72707C25A955FFFF9D2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <82a57f28-2cbb-4ef1-a1e6-7023ec2f34eb@app.fastmail.com>
 <SJ2PR11MB842439739B72707C25A955FFFF9D2@SJ2PR11MB8424.namprd11.prod.outlook.com>
Subject: Re: [RFC/PATCH] ASoC: sdw_utils: Skip unattached SoundWire slaves during
 endpoint creation to prevent collision on Lenovo 83SN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Bard,

Thank you for the quick feedback and clarification.

The explanation regarding the asynchronous nature of slave attachment makes sense; 

Thank you for pointing out commit 21f4552fbaaf ("soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro") in drivers/soundwire/dmi-quirks.c. We will track that commit and look forward to its arrival in downstream distribution kernels,.

Thanks again for your time and guidance.

Kind regards,
Fabio Lima

On Wed, 14 Oct 2026, at 22:56, Liao, Bard wrote:
> 
> 
> > -----Original Message-----
> > From: Fabio Lima <contact@thefabio.com>
> > Sent: Wednesday, October 14, 2026 3:37 PM
> > To: alsa-devel@alsa-project.org; linux-sound@vger.kernel.org
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; Bard Liao <yung-
> > chuan.liao@linux.intel.com>; Takashi Iwai <tiwai@suse.de>; Mark Brown
> > <broonie@kernel.org>
> > Subject: [RFC/PATCH] ASoC: sdw_utils: Skip unattached SoundWire slaves during
> > endpoint creation to prevent collision on Lenovo 83SN
> > 
> > Hi all,
> > 
> > On the Lenovo Yoga Pro 7 15IPH11 (DMI: "LENOVO 83SN", Board:
> > "LNVNB161216", Intel Panther Lake platform), the internal SoundWire audio
> > stack fails to initialize due to a duplicate sysfs entry collision during machine driver
> > probing.
> 
> The issue was fixed by commit 21f4552fbaaf 
> ("soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro")
> You could also test with the "ASoC/soundwire: remove ghost peripherals
> from the mach table" series which is still under discussion.
> 
> > 
> > We have investigated the root cause and verified a working patch locally. We
> > would appreciate feedback on whether this should be handled generically in
> > soundwire helper utilities or via a DMI quirk in sof_sdw.
> > 
> 
> > Questions for Maintainers:
> > 1. Is checking `slave->status == SDW_SLAVE_ATTACHED` acceptable as generic
> > behavior in `snd-soc-sdw-utils`, or is there a case where unattached devices must
> > have endpoints pre-allocated?
> 
> checking slave->status is not reliable. The peripheral (slave) may not
> be attached when you are checking it.
> 
> > 2. If maintainers prefer limiting this behavior to specific hardware quirks, would a
> > DMI match in `sound/soc/intel/boards/sof_sdw.c` for `LENOVO 83SN` be
> > preferred?
> 
> We have a DMI table in drivers/soundwire/dmi-quirks.c.
> 
> > 
> > Signed-off-by: Fabio Lima <contact@thefabio.com>
> 
> 
