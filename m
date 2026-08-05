Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE0B481AB7
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946155; cv=none; b=tijQAGXubW5RCOhNTc0NAfMof1sI0yX9g31ufe6h0wN/U65EIgYFLFJd1Fb4B3ISJo9Oao6jcSwx3xgMfZmiDdM2UZPTam3fZ7cGXD8FIoLRQeYgt9JKQ3/Nh7V6UB3ALRnyJN8y/W8RM327vgDov1vaBQcrcSv4dG6yywT3tqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946155; c=relaxed/simple;
	bh=46V7m8Wvqp6RSWp4cficoOX/s7EHo6NeNlypcctG3Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGuh0cI9mfgBcJwEdHUGTi0s3ojdLpMu9axXSoAwsGdetUET/Nv8KXn0yBvk67QVF36vJHEay64NGOHSWWpHtYl7TpaFCoHUWQVcESud7r90kG1bviFkIYmB+CC/smCigm7lHn2aZhRzWt30W+aXCv6xYLj5/e9B7FtjB2TMMzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Kb+NTukl; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Kb+NTukl"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hFb1J5Zbpz4430;
	Wed,  5 Aug 2026 18:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785946100;
	bh=46V7m8Wvqp6RSWp4cficoOX/s7EHo6NeNlypcctG3Dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kb+NTuklpTmYdYBl8J+JGDNTTv49Y+49AXHxj2qs6PITR9W8M4JlIXAW9OSjhwGcZ
	 xrTCUaEdMvmkkXpOGuDiY76LXtUfB2shk4ouOgZR1votM/K8rB6Xhekjn+QQYJHKBc
	 PsUHrezX7htdSFz2wlckDmpx1rBx8ukcMeNLMkSH8gFdGzdXkVsMu5j1voWgN139ql
	 OdoiYmHWZfpqC+UZaL2LopveSpW2X2tHkqQi1vgkVI9SDwkCBTmGXS7EASxtEb97dh
	 9PSwTXwqAm88YomCjunI2eMfvamTEQDtdgz6Kz+rAt9mvwV+YQdh0eicMuZwGr4ExH
	 4CwRpNQ96OD8Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hFb1J4tLpz43n4;
	Wed,  5 Aug 2026 18:08:20 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hFb1J1bpZz8svW;
	Wed,  5 Aug 2026 18:08:20 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9D2EF5FC72;
	Wed,  5 Aug 2026 18:08:15 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <931ce21d-6ec1-4502-bf5d-d3017626cc95@leemhuis.info>
Date: Wed, 5 Aug 2026 18:08:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] snd-usb-audio: SteelSeries Arctis Nova 5 mixer
 controls disabled as sticky
To: Gert Burger <gertburger@gmail.com>, linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev
References: 
 <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178594609587.2203274.3623259696760740237@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9D2EF5FC72
X-NC-CID: Kgu0/DmQ4ymiNaW3ERDXT0mbMxe2LYtMbHts8Un0yTo9/ZZX3yk=

On 8/5/26 17:41, Gert Burger wrote:
> On archlinux, after I upgraded to kernel 7.1.5-arch1-2, the sound volume
> is significantly lower and seems to lack bass.
> 
> Reported by someone else here: https://bbs.archlinux.org/viewtopic.php?
> id=314220 <https://bbs.archlinux.org/viewtopic.php?id=314220>
FWIW, somebody already linked to that exact report yesterday already and
Takashi already replied with some thoughts:
https://lore.kernel.org/all/20260804235515.7346606e.michal.pecio@gmail.com/

Ciao, Thorsten
