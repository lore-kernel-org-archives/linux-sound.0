Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8477E2FFFBE;
	Tue, 23 Dec 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486688; cv=none; b=k0tAdJh+SLRFVMOyZ9GNsXqgTNnh+5rP2S17iTXBrUM0kNLoIizhjqoaL+A1omYAf90TxM/J2v7UwNQ0EoKt3/pkQdIk8pjBPP1xcm7n4fGKc9VK+O5yBKQ8Hjw1HvfnC/W23vYcB8DPwcCrryD8dysP7i+dvajdaKs0UUaedH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486688; c=relaxed/simple;
	bh=8sdOwMgg2ZO61TS7y+FpenTgtYivfndVWpviXfaFv4U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sfMcwLYrF+xZLMKmlZ/NZkRf/yRSbxJ10AjuPx7w5csuxdJ23b/7F6M2kVyCiGkLn2BRurI8N3qLU4wHw9uEsLUPjD4iGl5MxmhsgYBJAibuHN370OhW234Ui7riOH7bc+7+NjDT8bvdmbMeqnD4mtbUvMJODQGzWwmPjXJp2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QeQqmFqG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VwFgp5W0; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QeQqmFqG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VwFgp5W0"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 744747A009D;
	Tue, 23 Dec 2025 05:44:44 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 23 Dec 2025 05:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766486684;
	 x=1766573084; bh=ZFLfJEdW4KGdEVvSYAKyivoL0y1+ygozW83FBhl/XSs=; b=
	QeQqmFqG3coYX0aQnBqtcsPu1QokpGxdMfLepv7wZ88wut8WLAT1DEy5niFjOkDQ
	Kt/aOGf8uCisUQ4G0rA1tvLzCINm1DRbUliYgSUHaROy6sul+Rx+biWFYjAC/Rk/
	58x6ZdMKuQxr3BPQx23qujrEN7TkNJZWTjCg2tnyfOjrQ71c+GD3Ddfq9uz+sv8W
	l8W8C8uP9q0Ox2kh3VI0xJzsOAD3Nj7nFkcdNZGdzReHvCNkJfGrGI9dklBKG9qt
	RfTzDRRGSpjBhlPJA+E1cztjtVOUpW5yazvM69GYrC1J+Mo2GJoh0nGUrlwMrJQp
	5BExTOjbDBDGdQLGwld4rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766486684; x=
	1766573084; bh=ZFLfJEdW4KGdEVvSYAKyivoL0y1+ygozW83FBhl/XSs=; b=V
	wFgp5W0BERJsVm+wyZTaKvMka//4yLsoJyqONbhVIfMwyg6IGyb+8W/rshpxAnP7
	hEYt8/ugbsd4bAuV39sKXp3QiCUcBI/++Yo4lDeVpNkqHNmtsFJY/yuIA+sIsvTD
	0T5CsrH9AcG9LIC7JAeDZeiyBWyLN2CtKzQAI+7NaajYfw7stOVN75zuIRqRLZgv
	jWps4WMk9nB7f6FezhSVwMLZ3Rdnf89ucS1PPxshT6QyfcJZHI9ebTceVApEVcnW
	HyRO6paSCb3UbWHjguFM+CBjDMkBVC4mWejIivPABaYyZUpl3I3YVcwpv4YyQU0X
	PXhUpB2M05Ewz9IZWDGdA==
X-ME-Sender: <xms:m3JKaSr5-I70dUYIi1hlmTlJilD4lQ_nr61qRHf59_jeF1duRdlobA>
    <xme:m3JKabemJIpoxbAPKz-VjqQUak4RrmjQfJl4xufGUR3vnWMQduhKurlgdCh76ebeF
    5I2s6xsDo31I8K4syXngbdD6UiTM5ZkLF1KTg_fB04fC1mttJ8hkZyf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehleeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgrgihtrhgrmhelheesghhmrghilhdrtghomhdprhgtphhtthhope
    hrrggsvghnuggrrdgtnhesghhmrghilhdrtghomhdprhgtphhtthhopehsthhurghrthdr
    rgdrhhgrhihhuhhrshhtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrohhhrghnse
    hishgtrghsrdgrtgdrtghnpdhrtghpthhtohepphhivghrrhgvqdhlohhuihhsrdgsohhs
    shgrrhhtsehlihhnuhigrdguvghvpdhrtghpthhtohepkhgrihdrvhgvhhhmrghnvghnse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphgvthgvrhdruhhjfhgrlhhu
    shhisehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhgrnhhjrghnihdrsh
    hrihguhhgrrhgrnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopeihuhhn
    ghdqtghhuhgrnhdrlhhirghosehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:m3JKaYqdKjamT3bAVE-8ldFsU0P_Z6kA6guXHkyoIAwk-_aPS418rQ>
    <xmx:m3JKaa_ZaO6d-XF_ex9S1ptGfUNU_bPUl3ROcNPBsfC1LdkxFmPNpA>
    <xmx:m3JKae2Lgd_mmT5q4FxQ7ZgEdgiCSznp8TIcXjp8qeysEtfC5dWwcA>
    <xmx:m3JKadBAoFsjVN2nYyQxq5zYqsxEXA6Z98ud9g7jAyCaAW66LjCfkQ>
    <xmx:nHJKaYwkyYidBK_6q5wjOMpHKc_PTuTk7UtKDThEoWPAn10FbDKTBilN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 321D1700069; Tue, 23 Dec 2025 05:44:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgVwluaQAvf7
Date: Tue, 23 Dec 2025 11:44:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Han Gao" <rabenda.cn@gmail.com>
Cc: "Han Gao" <gaohan@iscas.ac.cn>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Ranjani Sridharan" <ranjani.sridharan@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Maxim Mikityanskiy" <maxtram95@gmail.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Stuart Hayhurst" <stuart.a.hayhurst@gmail.com>, linux-sound@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <99af5127-05b8-4347-8857-19324d750155@app.fastmail.com>
In-Reply-To: 
 <CAAT7Ki-ddgsyJ4MDfn6MXKEBjXN__PZxWJQ_W5WjCcuaJ-_6Uw@mail.gmail.com>
References: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
 <ad17d046-158d-4019-b801-423896fcf5fc@app.fastmail.com>
 <CAAT7Ki-ddgsyJ4MDfn6MXKEBjXN__PZxWJQ_W5WjCcuaJ-_6Uw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override 64-bit MSI
 restriction
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025, at 10:40, Han Gao wrote:
> On Tue, Dec 23, 2025 at 1:01=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Sat, Dec 20, 2025, at 18:05, Han Gao wrote:
>> >
>> > -     if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
>> > +     if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64 && !m=
si64) {
>> >               dev_dbg(card->dev, "Disabling 64bit MSI\n");
>> >               pci->no_64bit_msi =3D true;
>> >       }
>>
>> The behavior is also wrong: if the system can use neither 32-bit
>> MSI nor 64-bit MSI, this would accidentally try to use the
>> 64-bit variant and then cause runtime issues.
>>
>> I would expect the only possible fallback to be using legacy IntX
>> interrupts, or returning a probe failure if that doesn't work
>
> Unfortunately, the SG2042 chip does not have an available legacy INTx.

Doesn't that mean that you can only use PCI drivers that enable
MSI at all? From what I can tell, only about a third of all
pci_driver instances do.

> db79afa1e57925ba96ab18514c0ebe42a28e393e
> 91ed6fd2c383bb8f02d66e98b4a4d2f7207249dc
>
> According to these two commits, these issues seem to be caused by powe=
rpc.
> Can we use the CONFIG_PPC64 macro to determine this?

I wouldn't consider it a PPC64 specific issue, from my interpretation
this is the same issue as in the radeon driver, where the MSI
is limited by the DMA mask of the device, and the correct way to
do it is to check the mask while enabling an MSI, instead of
assuming that any high address is broken.

     Arnd
