Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E273FF1;
	Sun, 24 May 2026 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779589405; cv=none; b=b4cQ++PiTEPHx4xNRbmLKSZSG4gGH4YG4SpihOKk+vbLljDXt3og5D2bjt3lTVqTIYht6SuqTkfH+11HO0RPcs5yyV3YuBQ8c9V89L9ojbo4ePF/xeENIZS0mUJcx+kmVew9ylr6MK39ohP3uUgeed/Q+qoRwBU/dCvwQ1AaMg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779589405; c=relaxed/simple;
	bh=4kO/1svI5rrdPJL3XX/sez+s0ZvgioqDygdCHvx7Bz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3sH6WIEuJDE2DIm50pO3PMaF4IA8naTmaMvFnQQMkuN/BSlg/De85+fl4zkkk1FGN/KMOiu1fWS3t+jeLulN/8zWKYfDtaKlfHCT7ywtZkRJOkRG8ojih4hRzNPFAFT76jeFffTRpcm5S6WurCdSO9jDWniZV7UGKDzsxHl1o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ROCbU2yw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cQM+VSEn; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ROCbU2yw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cQM+VSEn"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id E3B4B1D00029;
	Sat, 23 May 2026 22:23:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 23 May 2026 22:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1779589401; x=1779675801; bh=z2vsdnj9FNLADCBa/t7OXAVS9ilMlguE
	9whs6tK9fKk=; b=ROCbU2ywD9Tx08gn7yyfi6BOgR38x+uVzznbEJvL5S+5W7gP
	4M0SODANRXIOPmdsI5AJUdfnXdqgHkljYoSwECLlCfgwAQ4azPf5nT5EtDIXpgYu
	JdFSM2R4LwbbqqqhbLc/1yo7So0yLicSQJgYBsjgtHOSc5aONbynHvyevL7xzFoc
	dcgVl/4MwHMRT744j3gpSxFHPg8wyoKg2oKxWcxC3n/VnIK7vimWGHmY5U7tRu6N
	g30pHgvxOjI1ZXy3P8oJZf9alF/MyJTiIIVr0w5kgScFZkPbq/jiw7YAY7FWcfCf
	iGevsIUFmJb+zwlsagBcDlygZbXlmyD7CigIag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779589401; x=
	1779675801; bh=z2vsdnj9FNLADCBa/t7OXAVS9ilMlguE9whs6tK9fKk=; b=c
	QM+VSEnrYg8+9njCgdeDcTix94kQhixeHuBLRwOwXyPnRXLgSsATmMAiZW+2vzFR
	b3/mzrXoqeRThiLKTh1rMDEA1j6/DhTG227ySNncwYN/dppVHO2Vw/uaGRN8rtcr
	wwInJsDK8vtGNgVpVtC3VXSKn+7Ie967YaKH3mD3wRl4qbaSeS8ujmdICm641Gvx
	UG2kbg8QJsD7WhvDdUQAEgzq1ChS+K6XrqwZcbu9aok2Mnwq3QzL2RWI8PpFk9eF
	M0TagOeLfGQ+hG2lSRAycJFhGlsw41D+zDyGBK/PcBisxoZVwN4+8xwdpRKuPesa
	oNXwpILn6d95of/Xld5mA==
X-ME-Sender: <xms:GWESaiiC10vGUgn_ZIQSUd02xpaUzhlVhWzdvD1Wemy98yATkNbD4A>
    <xme:GWESatG63-h2dbIIT6M9XJshc-zliJmrJwwR8ovHV2HFWNBEV9qPZkAvNiBeBUs_U
    z2i-67mdF90pJyLTgp-fiOJHj8JiU7S5adw0-qFOQqa9kK9mzoXRx8>
X-ME-Received: <xmr:GWESap-soBOdsVkasU2YPcd9h_3HtrPm8j7Kn9jMyVR3Z3C-RlflZHN5qqmAHGEQjUS-F1PbPPP0F55rORrM-nFYxST_SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheegjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpedutdfhjefhfeekteekhfdufefgteeutefgvdffjedt
    heethfduudefgefhgfdttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggp
    rhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghsshhioh
    hgrggsrhhivghltghonhhtrghtohesghhmrghilhdrtghomhdprhgtphhtthhopegtlhgv
    mhgvnhhssehlrgguihhstghhrdguvgdprhgtphhtthhopehtihifrghisehsuhhsvgdrtg
    homhdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehlihhn
    uhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshht
    rggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:GWESasxUfUmSAmQcZRRIWwojAkzmI7rd0vagGXdkMzE8-zppKJ3L2g>
    <xmx:GWESatMgKYx1LjDFk69ztTj1ZF1kt4RFwDtWKTLYPsqGslcKtieEFw>
    <xmx:GWESap-pbVJEo4apLdlynVvuv0pT3sRsaurrRdPUY4i5tpC7AbMyPA>
    <xmx:GWESai6h6Aft1CxiSK8XCirXW-1_jOFZpUwFfSlIZSe8eKCNgleVxw>
    <xmx:GWESamqJDSIaGs6Oly4QFQiPSWZ9JaVj08k-VqQX73o2CxZ5rN2-LCab>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 May 2026 22:23:19 -0400 (EDT)
Date: Sun, 24 May 2026 11:23:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: =?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-motu: Protect register DSP event queue
 positions
Message-ID: <20260524022316.GA737850@sakamocchi.jp>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	=?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260521-alsa-firewire-motu-event-locking-v1-1-708e1c2b5e56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-alsa-firewire-motu-event-locking-v1-1-708e1c2b5e56@gmail.com>

Hi,

On Thu, May 21, 2026 at 08:01:23AM -0300, Cássio Gabriel wrote:
> The register DSP event queue is updated under parser->lock, but
> snd_motu_register_dsp_message_parser_count_event() reads pull_pos and
> push_pos without the lock.
> snd_motu_register_dsp_message_parser_copy_event() also reads both queue
> positions before taking the lock.
> 
> Protect these accesses with parser->lock as well. This keeps the hwdep
> poll/read path consistent with the producer side and with the cached
> meter/parameter accessors.
> 
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/firewire/motu/motu-register-dsp-message-parser.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

I remember that I was investigating whether to use the
'snd_motu.hwdep_lock' spin lock when working for this code,
especially for 'pull_pos'. The 'snd_hwdep.exclusive' is used to constraint
the number of file descriptors to open it, and the spin lock would be
protect the concurrent access, since the pull_pos is referred and updated
by user process only.  However,
snd_motu_register_dsp_message_parser_copy_event() is called outside of
the spin lock. The suggested change is preferable.


Thanks

Takashi Sakamoto
