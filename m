Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC8F34AB14;
	Tue, 23 Jun 2026 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241357; cv=none; b=pnLk6QWKG/4edplt7omfSG0H0eY7TV8jc/2Tojuutg4USFALfaG1BIt1ALEr/jgam3r5tPGHvTE76B4VUad7z8JYbmyGbQ1koZD4V/fJ2bev/tbSNNbFCSqAUXrOFtgPMY4A+x6/BytA5t96CXnQGAPKdQph03sUQ6gVQTKWcjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241357; c=relaxed/simple;
	bh=oXSpwGUh9frmcgaayIzjUjfuRKaRvK2WGqxKcmxPPiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbPJMmhikX6AceKzZ9dKwsvnUw+pSuJyylz3jWpvjpcNELxeBTHo1EFcnsYDVSX6E87NystpX+F61J1J5o/nPWwNRj0pba27zUyGe+hOdiMcbbjJDyBVwFQo+njX96G2uw+yuEetasWmIwC/QyAFaf+d4OBJRejl/c1W0caD000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=christopher-hoener@web.de header.b=GsLtK57q; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=christopher-hoener@web.de header.b="GsLtK57q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782241347; x=1782846147;
	i=christopher-hoener@web.de;
	bh=oXSpwGUh9frmcgaayIzjUjfuRKaRvK2WGqxKcmxPPiw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GsLtK57qET72eNcEv1wJCz1hMtr46My46OCZBg3GAiOFcrHdQvLYbDboRnLM6wh3
	 MSivkPQ6lPNr9V7mMGC48uKsmg4EQ7zIUQ0nYnTn/5EtAD5Rkvz/80PAGkFL70YYO
	 +Kzvet3iXvNpVoNdJDJNP9nvW61g7EoeJYPZ2xbKm8h37Xw1Y3uaM2B5ei59kWRma
	 tGtZ4p7OJMecE2XNoclUocnxIhMGWO8ukSblp/6VcS3ybDtdmDZAjZKTSFA7wAFVC
	 6ttZhtr6KTo4dMPiZsL64j6lerY0M0NTjFcVwkXi4wbhPn/rtl/uTlcPVZtePpqZW
	 6y7bsrxKC6dmy/nTNA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjgT9-1wzuxd49F5-00mjZu; Tue, 23
 Jun 2026 21:02:27 +0200
From: =?UTF-8?q?Christopher=20H=C3=B6ner?= <christopher-hoener@web.de>
To: tiwai@suse.de
Cc: christopher-hoener@web.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: hda/realtek: Enable internal speakers on Razer Blade 16 (2025)
Date: Tue, 23 Jun 2026 21:02:07 +0200
Message-ID: <20260623190207.3242-1-christopher-hoener@web.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87cxxhczce.wl-tiwai@suse.de>
References: <87cxxhczce.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lgF0GX+r1LBXseYPyqjFtxMbvc64dv00ZbPDSbAEI+6G1JaPlI/
 6NYuriZKQtzIpzdC2IRTntTatC1eeMQp3+xxU6PW0ISLWcHAxK3k7TsoDbCRhniyD9S4qwH
 H9BV6YqxuR6ueDsqBX8moMpv4r8uI1rUVGMw2ZJ4tbjM8NW867oCsVProEAU27xCuUwERcB
 i/cG99hy9tt8sz5bf2J9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8ZFXj+QOEeI=;Cdn/WgQxGqtVGTFGrRGBZue+y2s
 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

Hi Takashi,

thanks for the review.

v4 moves the captured programming and the fixup into
sound/hda/codecs/helpers/razer_blade16_2025.c and uses the full model
name throughout, so it can't be mixed up with other models.

On power_save_node: it works, but it clicks on every stream start for no
real benefit here. Given the click -- and the existing fixups that
disable it for exactly that reason -- I kept the pcm_playback_hook.

I also couldn't drive the amp from a power_filter: the per-path power-up
on stream start goes through path_power_update(), which writes the power
states directly and never consults codec->power_filter (that only runs
on the codec-wide transitions), so the filter never sees the
converter/pin coming up for playback.

I think v4 is ready - I hope you agree.

Thanks,
Christopher
