Received: from www36.your-server.de (www36.your-server.de [213.133.104.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216C346E51;
	Sat, 28 Mar 2026 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774725871; cv=none; b=XejPfbOn50IVdTrKEy+GkJz7FLdeMeg1JkLJACTDorEYRA9ezQQtbQbdJcihnMzL6llLu02pmQKmNEbwCLD/qooNe0mp0jmcPG03G8V57asrBahHFlD1Tmvpv547q/ziPJqMvbEsq43SGv3MUfxHfbr6xVEnpXJTH5v2jXl0WgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774725871; c=relaxed/simple;
	bh=m5NjxIBY0YVd2TG8fm3IgM0uS0k8ScT+jKT+p3HO30I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pk7+i1ivE5yIlC4PJUsSHrktN/2NmEp0NrfC6Xwtwem36CVLU4cEAN5jojMtuxBjH7NY7NLITIRsJsgrBXNn/aK5Sr8h4LePwx86kRBjs1RX7t7zH14qzEdhg03lWjXKPmTopyg+1O1vfuPf9va0Uv4fMtgokfEUbHWpoXQJzjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de; spf=pass smtp.mailfrom=hohmatik.de; dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b=fuTezz8P; arc=none smtp.client-ip=213.133.104.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b="fuTezz8P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hohmatik.de
	; s=default2501; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=m5NjxIBY0YVd2TG8fm3IgM0uS0k8ScT+jKT+p3HO30I=; b=fuTezz8PwYqkHP9NBYZWCwGaou
	ph5cFvX/S/eMOpzUq4EV4Dtj+aJVdbDwMHm6S2wi0FL3Wm7RArPv7unjybKS6mA3skG+gQkdfI7wd
	HHc6FYxtQR/WtO8Qem2FQy6yE1+5n0GdrFxcFjHdljimkvX+tjg5DBFg014WEpt5BV2QhRl34Hi7n
	XZH2LK1T979bkBNQqsfIkp++YrT6paiLcHO5ZJcXxoQoqlitqWOvv3cUZ2KCP8cPXKrM0wrU7VuES
	2S3aYVKltw5+/dy0v6Nkd+BwA7gy7rg5qU9QDfyoZbN5l6S6teD6oD5uDeG0Jkh+LiIqJUoQ+1wS/
	Sp9FTOAw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www36.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <linux@hohmatik.de>)
	id 1w6ZGc-0008KK-0h;
	Sat, 28 Mar 2026 20:24:18 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@hohmatik.de>)
	id 1w6ZGc-000E1Q-0N;
	Sat, 28 Mar 2026 20:24:17 +0100
From: Karsten Hohmeier <linux@hohmatik.de>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux@hohmatik.de
Subject: Re: UBSAN: shift-out-of-bounds in sound/pci/ctxfi/cthw20k2.c:956:31
Date: Sat, 28 Mar 2026 20:24:17 +0100
Message-ID: <20260328192417.17980-1-linux@hohmatik.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87cy149n6k.wl-tiwai@suse.de>
References: <87cy149n6k.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27954/Sat Mar 28 07:24:17 2026)

Hello Takashi,

I applied your one-liner with the previous patch still in place.
The module loads and kernel boots without messages.
Since the one-liner seemed SPDIF related I also tested the optical in and out and it all works.

Idk if it is the hardware or just a quirky implementation, but the SPDIF-in is grouped together with the analog inputs and without enabling those AND turning up SPDIF-in in alsamixer I don't get anything.
But I think it has always been like this.

Thumbs up from me if you want to turn this into a proper patch again.

Regards

Karsten
