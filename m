Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A915687D
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255133; cv=none; b=gssVTjn/qbbGJ+LLE414C6bPKQjFnnexBWGp5C/xShPkJWhfjwTi16zvUub1GVyyrpGx2p2z9JX9He/hSD8zcFIeN44Q5Ek6TUlgOr1/xhhEbTuGUsChfRg1qM10PGs+SRk0LRAqDDyfBB524bEV6VBlF+Mb1EmQd5NJUDPqAng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255133; c=relaxed/simple;
	bh=vLlKBfiUZ8jHnIFgRjRTGfHLdHtNDHSxujcvuZF3Hv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXUByxD3s7NKP97mkWs4hb5bEeEvdGp7ZzpTE7Wl4dhVY27KlIJS1nN6Zcx8uyhWI/TdCDmgOAnZyAB+A7qPQTpBNPlce1Rq8p531y12lW8qtXwgDNH+MZC8zaunXg2qtylA+02qRCb2N2P3Xv5o7sQZStxtRsn+XclR3c+u4LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iRDfAKda; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iRDfAKda"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gBtjz3gHRz9tsk;
	Fri,  8 May 2026 17:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778255127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGvfGw0nhmCwlVK3TDQtmjDHY88ZNxQpyTLInW59rdU=;
	b=iRDfAKda0FggPQNC62D8n2s4+7blP0agIVKxyTopjOEK8RLwH4wpP5t5kQAst+10J0758W
	D+crGppLXcNeQVQrBdme8aMCrJA29uk9QLTExerR+r9garm3ayxlmpJRPSyL5fVts2Xb5p
	ZXsS7ghCNOeHIiNFKmZ1rnQ9nh6MYL185Bcz4LX1cA5hkXSKE+Y1ceamymOJI//zq/y4eE
	BeCFop/aO0Wx2Q9Hrq3ugLMGomGrR63RIjUhGNNfTG81g0bTSNU6+p4bKn5wFOrvKwCiZ9
	lSx59E8slf1OLafClxvA4o1hQAik7wLnEuvk2+h1vkDXlenAoFje2IStQ5cBZw==
From: Tobias Bachmann <tobac@mailbox.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther Lake;
 chip stuck across distros and kernels; worked initially;
 still working at hardware level
Date: Fri, 08 May 2026 17:45:19 +0200
Message-ID: <77iVa-LES8uCgAj99Tw0vA@mailbox.org>
In-Reply-To: <af3/iDwepJuCaJNm@opensource.cirrus.com>
References:
 <cLVwl4lrR76pLtv8VxMSaA@mailbox.org> <af3+Q1jx7z5tL+Yn@opensource.cirrus.com>
 <af3/iDwepJuCaJNm@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-MBO-RS-META: kqi961ar5r43bfcn5spsfoi9t8jjk8wg
X-MBO-RS-ID: c8e0bc2767e6c137ff5

On Fri, May 08, 2026 at 5:21:44PM CEST, Charles Keepax wrote:
> On Fri, May 08, 2026 at 04:16:19PM +0100, Charles Keepax wrote:
> > On Fri, May 08, 2026 at 04:56:03PM +0200, Tobias Bachmann wrote:
> > > On Fri, May 08, 2026 at 10:41:10AM CEST, Charles Keepax wrote:
> > > 
> > > From what I can gather, the audio path doesn't appear to gate on
> > > _STA
> > > for this device:
> > > - soundwire sdw-master-0-0 still reports SDW Slave Addr
> > > 
> > >   3001fa424501
> > > 
> > > - ACPI still announces the SDCA functions: device:29 SmartMic,
> > > 
> > >   device:2a UAJ, device:2b HID
> > > 
> > > - sdca_class still binds and reaches "probe complete"
> > > - sdca_class sdw:0:0:01fa:4245:01: timed out waiting for
> > > 
> > >   device re-attach (5s after probe complete)
> > > 
> > > - No soundcard created
> > 
> > Hmm... yeah I think maybe your kernel is missing:
> > 
> > de67b4ea168f ("soundwire: slave: Don't register devices that are
> > disabled in ACPI")
> > 
> > I think that was only moved into Linus's tree after v7.0. If
> > possible you could pull that in and retest.
> 
> Although I am little worried more might be required looking
> more closely. But let me know if you can test how it gets on
> otherwise I will add it to my list to poke. I think last time I
> tested that it was for a device that didn't also have a bunch of
> SDCA stuff and some of that runs through a different path so
> little nervous that might need a gate too.

Fortunately not. Tested on 7.1.0-rc2 and the speakers work fine. Lovely 
stuff :)

This is probably a very unique solution to a unique problem. But I'd be 
happy to test patches etc if you can use this information to foolproof 
the architecture, which might help others.

Best wishes,
Tobias



