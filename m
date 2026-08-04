Received: from us-smtp-delivery-172.mimecast.com (us-smtp-delivery-172.mimecast.com [170.10.129.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF622495522
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865345; cv=none; b=r5PP2UCXfKdpu1HV4Dyv9N1HwFoWJ2GSLEYvbe79t++P/ZeJO3rFex9HmvAfzA0++Ms4E40lnHZAAOym8WPvpHncRootsXjr6i1w3xNXRjT6wgZwplJd2byXAKQEIkMCTdBaDkk/Vi36Y5XhOrZHPqGwO4hYQSOYnuX/txo/m4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865345; c=relaxed/simple;
	bh=x0jPiCfPSqlgZnS4eBVx+A1nrWrzJXpm1zta4007ut4=;
	h=MIME-Version:Date:Message-ID:CC:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=N8Ld2QfgATDCUsSPycjYAFlwnk++5Ues9jVdn/IovnRL74alkDtgIe2Ri87EnqMKDRK3XGcDPgfNHlSOiAT+gkNYRAg/Ttft8zIFvcuVwJDxZLh7EFnXzTtu1T9qcU1oWgpok5a6oF6B2LjaXASvJyjFC8BOV73PFFXk+PV4ZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com; spf=pass smtp.mailfrom=valvesoftware.com; dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b=T/XwyAeW; arc=none smtp.client-ip=170.10.129.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valvesoftware.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valvesoftware.com header.i=@valvesoftware.com header.b="T/XwyAeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
	s=mc20150811; t=1785865341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1+f1SRXwQR+hV/xRmU2nSPocNbZYNyw3TwCfXkirFc=;
	b=T/XwyAeW93o+wAEYLTXCYTrzOi7m5fwvHuK6dPKfjAeWxO7O3P1jmJ7mbEV9BlZymPkC6y
	jzreIBYac+OjMVb/je4QDPg0blfKWdtwYs2dGRB6oC1xbBrSXYZ5074gwpDf9kKIMvg0BV
	X4albjryaYMv3WHplandE1ysZDtEMqw=
Received: from smtp-01-tuk3.valvesoftware.com
 (smtp-01-tuk3.valvesoftware.com [208.64.203.181]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-569-ex-z62EUOy6pKVcUyVdddw-1; Tue, 04 Aug 2026 13:42:19 -0400
X-MC-Unique: ex-z62EUOy6pKVcUyVdddw-1
X-Mimecast-MFC-AGG-ID: ex-z62EUOy6pKVcUyVdddw_1785865338
Received: from antispam.valve.org ([172.16.1.107])
	by smtp-01-tuk3.valvesoftware.com with esmtp (Exim 4.97)
	(envelope-from <arunr@valvesoftware.com>)
	id 1wrJ9e-0000000FWWa-18Dc;
	Tue, 04 Aug 2026 10:42:18 -0700
Received: from antispam.valve.org (127.0.0.1) id he8i7k0171sd; Tue, 4 Aug 2026 10:42:18 -0700 (envelope-from <arunr@valvesoftware.com>)
Received: from mail2.valvemail.org ([172.16.144.23])
	by antispam.valve.org ([172.16.1.107]) (SonicWall 10.0.15.7233)
	with ESMTP id o202608041742180003750-5; Tue, 04 Aug 2026 10:42:18 -0700
Received: from localhost (172.18.17.18) by mail2.valvemail.org (172.16.144.23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 4 Aug
 2026 10:42:17 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 10:42:17 -0700
Message-ID: <DKGCFDZL0ZPJ.WU7CLZ8ZJKOI@valvesoftware.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Arun
 Raghavan" <arun@arunraghavan.net>
Subject: Re: [External Mail] Re: [PATCH] ALSA: hda/core: Log stream DMA
 errors on interrupt
From: Arun Raghavan <arunr@valvesoftware.com>
To: Takashi Iwai <tiwai@suse.de>, Arun Raghavan <arunr@valvesoftware.com>
X-Mailer: aerc 0.21.0
References: <20260803-master-v1-1-9bcedb736978@valvesoftware.com>
 <87tspai11y.wl-tiwai@suse.de>
In-Reply-To: <87tspai11y.wl-tiwai@suse.de>
X-ClientProxiedBy: mail2.valvemail.org (172.16.144.23) To mail2.valvemail.org
 (172.16.144.23)
X-Mlf-DSE-Version: 7580
X-Mlf-Rules-Version: s20260801042314; ds20230628172248;
	di20260728152631; ri20160318003319; fs20260804163420
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: arunr@valvesoftware.com
X-Mlf-Version: 10.0.15.7233
X-Mlf-License: BSV_C_AP_T_R
X-Mlf-UniqueId: o202608041742180003750
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cKxMDhtzTjWFFawRODVzGOlpVXBSG3BX1H2vpVSE7gM_1785865338
X-Mimecast-Originator: valvesoftware.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 4, 2026 at 4:21 AM PDT, Takashi Iwai wrote:
> On Tue, 04 Aug 2026 00:07:52 +0200,
> Arun Raghavan wrote:
>>=20
>> The stream descriptor status register reports FIFO and descriptor
>> errors, but these are currently cleared silently along with the rest
>> of the interrupt status. Log them, rate-limited, so DMA problems are
>> visible instead of only manifesting as audible glitches.
>>=20
>> Observed on some AMD GPU HDMI audio controllers under specific low power
>> circumstances.
>>=20
>> Signed-off-by: Arun Raghavan <arunr@valvesoftware.com>
>> Cc: Arun Raghavan <arun@arunraghavan.net>
>
> Applied now to for-next branch.
>
> It's interesting at which situation you get the error bit and which
> one.  If it can be used *reliably* for catching a streaming error, the
> driver could notify XRUN or error appropriately, too.

Ah, I should have mentioned that in the commit message. The error bit
that was signalled was SD_INT_FIFO_ERR -- the status byte was read as
(SD_STS_FIFO_READY | SD_INT_FIFO_ERR).

We are still working on pinning down the precise cause in this case, but
it seems to be related to issues in some specific setups during lower
frequency memory clock transitions. The error manifests as a short
dropout caused by what appears to be a stall or missed transfer. The
frequency of dropouts varies from several per minute to one every few
minutes.

In such a case, the existence of XRUNs might be good to know further up
the stack, though it isn't clear that there is much that userspace can
autonomously do to mitigate the it.

Cheers,
Arun

