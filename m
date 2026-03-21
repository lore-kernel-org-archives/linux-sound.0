Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D92BE7DD
	for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774109980; cv=none; b=n7pPKhB0GnWEjwAgFL6fyM91Rl0QOifGkVtMugcHew+4frx/ikxgwzWtGCHmCjPxP+flGAKMEDpft5H+wmfKJgB027xZIARFnzAeKKIpY8MoT4jVEPR+Hj0Is2UwCo6KHi5jPro1TKILhlK8/NB6xSK0+cqbtxjSoe+KfqsWNZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774109980; c=relaxed/simple;
	bh=PZL75f1785kH6W1KTLnQins/Y7VuO99UIDw93SbygTs=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=eoeQoA+t3re2tQ6NWFJGjWEKq2fIgYJUs/DwEZv+TTC29wWaA2UYkYTo8IXz4C7Dqg6bf2bxI37wca0/ecMQ41YNAxYShs5yBaDjB123O5WNQDMZ4zTDHldrgrdGj3vXGWvxSeNzKvS0ljg+vZrDP6Cz90jEEelMGIOopYK7fXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Gu0TqMDi; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Gu0TqMDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774109968; x=1774369168;
	bh=PZL75f1785kH6W1KTLnQins/Y7VuO99UIDw93SbygTs=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Gu0TqMDi0GcaHyAKzGndIbfgvsCCk/95vcXrKkXuzjeKXF4VwgfPr5gT20PNTapcQ
	 Ma1D2CLiOc6TWmjHLjuw5TPucGsRgPU9KAc0DWfx+aIM8ea/4WNnUW3EB163rAo6tr
	 5qFN4Zk0fxlZibCYZyh71vSVrGmkpwrxuDNDrhrcsxfB2es8MRyTSIXG/QL1tk+scP
	 MIrOkAAHd9p97ddhEdM2iwYNtd7U3tZgl6CMKhLr5okrDIBZ1dlFTlnwbk4SFbN4F5
	 xUC7kEynEBk7QnmcrxpHI8AfNJaTRTS9pYgYX/boNG4FQthe2rCa/BRo7ErEB/26NW
	 nF4s1vSDHT7jQ==
Date: Sat, 21 Mar 2026 16:19:23 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>, Stefan Binding <sbinding@opensource.cirrus.com>, Zhang Heng <zhangheng@kylinos.cn>, Chris Chiu <chris.chiu@canonical.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: =?utf-8?Q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
Subject: Sound quirk for Legion Slim 7 16IRH8 breaks volume control on Yoga 7 2-in-1 16AKP10
Message-ID: <i_S7iS6mWHUQexU6eMS8mOTAzBhZjnV3XUZlbfNkXVtGJN-tnGpBVMC_mTit5moylkFcCtpQpjospNM-S7X4a05cl-gdL1sQSk0BKuqYbhQ=@protonmail.com>
Feedback-ID: 121526638:user:proton
X-Pm-Message-ID: b75956136ef83aafc083f56786b551c11a6cb86d
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello

I have discovered sound volume control on Lenovo Yoga 7 2-in-1
16AKP10 [0] laptop is broken by a quirk applied for Legion Slim 7 16IRH8 in
sound/hda/codecs/realtek/alc269.c at line 7578. Both devices apparently
have a sound card with the pci id of 17aa:38b5, which triggers the quirk.
In my testing, commenting it out resolves the issue.

I do not know how to handle conflicting quirks like this, so I'm messaging
you to report the problem, and ask someone to fix it or tell me how to do i=
t.

alsa-info report, generated before the problem was found
[0] https://alsa-project.org/db/?f=3D1de95f933bbbb6f22d917b1ba537d562d90eb7=
62

Best regards
Kamil Go=C5=82da
