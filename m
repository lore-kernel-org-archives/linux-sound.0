Received: from www36.your-server.de (www36.your-server.de [213.133.104.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD053218E91;
	Sun, 18 Jan 2026 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768763826; cv=none; b=TazRwJ0tnOCieaLxCFeskNhUv2yrhTLtLn5PqbDc+clm/hFk+w7S+DRKtFYVKGkbcUgz8eRoPrbvU/9eId9UpiuZBw8kuTdIgkbODvwCjoQ58tjlbjic5D9Y+n2jGcsYsABTmppkCPEYx3dVwxvkN8K9Ye9qBmVtCCnC/+S58jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768763826; c=relaxed/simple;
	bh=DNI000b6JDwf9QrOMaIB91gQeAzFT7SW4vKmqhg3vYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnItY4ZIxuBUrP0od6Z0npVDZRNOQSi0HBRdewBlankzF5Mvbl7lkn723Wr5dHcJ3oa7HyewVKlpYeSmxY9SlogfSC0GtTyypjyVNAkap0FrHv1aphoMT9fk7Z2Tsmz6tjC8tDmuwewdfh5onyqPo2XGV2bUORR34uLE7syH2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de; spf=pass smtp.mailfrom=hohmatik.de; dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b=gzyASyNJ; arc=none smtp.client-ip=213.133.104.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b="gzyASyNJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hohmatik.de
	; s=default2501; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DNI000b6JDwf9QrOMaIB91gQeAzFT7SW4vKmqhg3vYM=; b=gzyASyNJpKW05B8/glELLl8ro/
	xKDhpW7aS3fTu+l2502QGq/w1MQccFxDa86L/H5uVjgY9FSI6qnrGPp13z7GrrggRfyzsW3ucglqx
	mNt18nSYbwmqnu5aRtKKjOWI3zaovS8F3svqV3/w20VuvBpkTwkezjNSFDpDY7AoII2mVLiPxPmBf
	GB4LgzIMga8+OtOQf6m35Z2NY5O4shZrUwxr2rds+hqA0XT54fctn+1/3Br2uQGHmMVh5e40plQIj
	oB4msxGdlLdNmMIr12PhHNcGcET19N3IgVMVDvZahWCGnd83S77hOf0P9H453inV0/1x76lf53Tb0
	Jzuqurzg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www36.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <linux@hohmatik.de>)
	id 1vhXp1-000AQJ-34;
	Sun, 18 Jan 2026 19:48:24 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@hohmatik.de>)
	id 1vhXp1-0005xi-2U;
	Sun, 18 Jan 2026 19:48:24 +0100
From: Karsten Hohmeier <linux@hohmatik.de>
To: tiwai@suse.de
Cc: 1121535@bugs.debian.org,
	carnil@debian.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux@hohmatik.de,
	perex@perex.cz,
	tiwai@suse.com,
	waxhead@dirtcellar.net
Subject: Re: Bug#1121535: UBSAN: array-index-out-of-bounds in [...]sound/pci/ctxfi/ctamixer.c:347:48
Date: Sun, 18 Jan 2026 19:48:23 +0100
Message-ID: <20260118184823.26480-1-linux@hohmatik.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87pl7lgzd7.wl-tiwai@suse.de>
References: <87pl7lgzd7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27884/Sun Jan 18 08:24:07 2026)

Hello Takashi,

Your second patch works. Boot messages are gone and the soundcard still works as usual.
Thumbs up from me for upstreaming this.

Karsten
