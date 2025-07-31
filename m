Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE374A94A
	for <linux-sound@vger.kernel.org>; Thu, 31 Jul 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753967846; cv=none; b=b6J71pqXg4/O1EOHd0wS9aFNonAOrVaEqMIvBAUosPt9GfP8Ty5UzJVGGG5ejYuVFpXYY561OTUiXkxqQ1x6shAcGOZFPOC7hL59vSTTojOo4vtOl9moeEZ72ONpnj8S0MW7BP6rukebtldw6p+cvMjkV7ke1hJmE4z7DdTXq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753967846; c=relaxed/simple;
	bh=iiwvIA7xXD0nMz4oqfatTVzhZqJN6RQWoTqm5O7GxCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0dkKlFeu4zGZOA/bdD7+2Wn80kgct9jUZ2MBvNAj8bw37ciq9xzSr6i3Tv/NuloOaePxAoz+qK/YLXNizqbvkqyBQTS0v2cPdqWgtV4HzjVkzxbXQtRYIHu1DH0Vlj9o6q2+1iOKvCvv4vh+AuTXwwc8fPzyx/KUfZNbSFVNkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net; spf=pass smtp.mailfrom=internode.on.net; dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b=ipnUUHSp; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=internode.on.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b="ipnUUHSp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=internode.on.net; s=202309; h=MIME-Version:Message-ID:Date:Subject:To:From:
	content-type; bh=8fobJJ745fPcKBo+BWZt+4ffDA54aCmGV/3N6MXOlro=; b=ipnUUHSp4TAJ
	ap6QnsN7S3vDooFcruQ3hHgaFTbvh8KmBtkKSl9oYuEPTRXEauZ7WGFz9gQerjKwq3d2qdysvodwK
	AOI9RDjwss+MBSLi2MiufjmgyM+trWhAnM0GAi/tGkWU+oKvG8xPVm9Gat3KQEia3JmlvF/dPf++u
	V6x1w822101NklrUuNGg7sAZJ974TFuRNuj2S5+cgNfxGaRpARaXS6xOkeZBzrqZPrU36eJVrb2wE
	lozkW9ejo7Hu9FeEeEAaahce4kcKEJh3D6JC7g6i+A5Mq1mCsqDByrRp0WQ5WLXfcQ6j5slFDAOlj
	n5m5v6VcOvpLumrby8xPbw==;
Received: from cmr-kakadu01.internal.pc5.atmailcloud.com (cmr-kakadu01.internal.pc5.atmailcloud.com [192.168.1.3]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu01.i-00ed5f122635adb7d) with ESMTPS
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhSS8-000000002V6-2WnV ;
	Thu, 31 Jul 2025 12:32:08 +0000
Received: from  (localhost [14.2.105.157]) 
	by cmr-kakadu01.internal.pc5.atmailcloud.com (Exim/localhost) with ESMTPSA
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhSS7-000000002gt-3g08 ;
	Thu, 31 Jul 2025 12:32:08 +0000
Received: from amarsh04 by localhost with local (Exim 4.98.2)
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhSS2-000000001cS-0hJa;
	Thu, 31 Jul 2025 22:02:02 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: tiwai@suse.de
Cc: amadeuszx.slawinski@linux.intel.com,
	arthur.marsh@internode.on.net,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com
Subject: ALC887-VD line-in not visible
Date: Thu, 31 Jul 2025 22:02:01 +0930
Message-ID: <20250731123201.6220-1-user@am64>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <877bzoudpk.wl-tiwai@suse.de>
References: <877bzoudpk.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=XIU2SxhE c=1 sm=1 tr=0 ts=688b6247 a=OuAXCDeWEIhuZeJxW2dRvw==:117 a=OuAXCDeWEIhuZeJxW2dRvw==:17 a=Wb1JkmetP80A:10 a=x7bEGLp0ZPQA:10 a=ZWTVfbmrPR8A:10 a=k1gCqWAUogLJDQ4uarAA:9
X-Cm-Envelope: MS4xfA9ElECTx1+vGL6lyQHw8JPJqPX5afdQAw56krGbCbvHJMFJ4sje8zbELmTeCuV5hsNPVAu9LEkDx/HgYBET7/mEDd44O6gpj9QbcEfqa6QSzEOI5Kqw rtqCJ5AktR6bTt/95WVJey2oCSisRhNQ2ZI8SdljX1GLPwyXKA5jQ6R10G3N+ersdrEeXSQcPOFBhA==
X-atmailcloud-route: unknown

Thanks, I found the discussion with Linus about options and enabled:

CONFIG_SND_HDA_CODEC_ALC882

It still gets confusing that 

CONFIG_SND_HDA_CODEC_ALC882

also applies to other ALC88* codecs.

I also enabled:

CONFIG_SND_HDA_CODEC_ALC882

even though I generally don't use HDMI out on this machine.

Arthur.
