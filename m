Received: from omr001.pc5.atmailcloud.com (omr001.pc5.atmailcloud.com [103.150.252.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB31F22F740
	for <linux-sound@vger.kernel.org>; Thu, 31 Jul 2025 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753966921; cv=none; b=f2ZxeoJ2nb3vTkxyNELuqMIgqHPk+zsYc5t38IU2RosLMeAtxogqfboylNhToQC2ZFCYGX9rB+GrdHUjq6doLkNUZ1u8XrVci95cs6DA5IJ4G9v+0EG+duU2k/u3GUlyfss516UkyElFErsW4uoDsHwIO8ZURmrdZTHPNATuAS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753966921; c=relaxed/simple;
	bh=V8KyIbusFmQYd3WfmMM2Xz69gWaxCJmzyr3wGnIoJ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0KLAQdb8nxjLUuiI5X5tKtDwhwIuRdJVYN+tjKy64dU/asldDxutbENmCb3bL9NV7pjQP5cCrUuz6psd65A6LvcG7lUaBLFETHXJp88stUPG4nNn/ELuP8fZzYsAJ1mySjuA19lKPsK9ygVUlt3TAChFHsApM/o1BaiKtAO5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net; spf=pass smtp.mailfrom=internode.on.net; dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b=mpFS72wq; arc=none smtp.client-ip=103.150.252.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=internode.on.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b="mpFS72wq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=internode.on.net; s=202309; h=MIME-Version:Message-ID:Date:Subject:To:From:
	content-type; bh=V8KyIbusFmQYd3WfmMM2Xz69gWaxCJmzyr3wGnIoJ9o=; b=mpFS72wqlWWk
	YZtqBw7lLT80S6bAnxqeLHRscsRvTHma90HXmKPGc0ZJe+rwaB9+uRHBK0rHQb2mfzs4WIEWRViN6
	SstTce/x93OpzLdgV5WLen47iG1NC+s02gXkHeS2Y/FN801ivwvX1qDon8nXOkllCei2l4IVxU2SY
	3EJQy6BxzyLJGBjSoX3rgFy8Ruuc2dj2htGK9iigWs1VX9S6u30juZDYht7cRR3bMweoULEqhgoiO
	ybZ5P5kVJA8MYCMeS+gxp3rhLhzZWOjx6neBDMPw84UqsKnZlpfiVuKVFgWifFELzJFKXhr/JEQV6
	FBS5clI8keWQkEIeFMwpNg==;
Received: from cmr-kakadu01.internal.pc5.atmailcloud.com (cmr-kakadu01.internal.pc5.atmailcloud.com [192.168.1.3]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu01.i-094bd7ff39e9a1d20) with ESMTPS
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhSuv-000000005iI-1jHX ;
	Thu, 31 Jul 2025 13:01:53 +0000
Received: from  (localhost [14.2.105.157]) 
	by cmr-kakadu01.internal.pc5.atmailcloud.com (Exim/localhost) with ESMTPSA
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhSuu-000000002DI-2RZf ;
	Thu, 31 Jul 2025 13:01:52 +0000
Received: from amarsh04 by localhost with local (Exim 4.98.2)
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhSup-000000001oK-2C6F;
	Thu, 31 Jul 2025 22:31:47 +0930
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
Date: Thu, 31 Jul 2025 22:31:47 +0930
Message-ID: <20250731130147.6956-1-user@am64>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <87v7n8r0xa.wl-tiwai@suse.de>
References: <87v7n8r0xa.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=R6sFG8RX c=1 sm=1 tr=0 ts=688b6940 a=OuAXCDeWEIhuZeJxW2dRvw==:117 a=OuAXCDeWEIhuZeJxW2dRvw==:17 a=Wb1JkmetP80A:10 a=x7bEGLp0ZPQA:10 a=ZWTVfbmrPR8A:10 a=0l96_rDUOEdFxrnl8sIA:9
X-Cm-Envelope: MS4xfCcLuGH8ubZlc9ezSlQCqNAh6YZD+VLiWDqf6D0TjGXIVaBs/0Ic25qnbQpivS3fLNWX0PRy87XSBYUvhx2xUqHwSq/NgAU/KdWd4kiBmBnjmELCGQfS tq5jCxR5BLPdlhVVdw1Pr1vpDcu6tZBbSCFQ5GKVmBTRFDHBVUG7msSEeqdFHaeSWnOSbsd2gaHAUw==
X-atmailcloud-route: unknown

> I also enabled:

> CONFIG_SND_HDA_CODEC_ALC882

> even though I generally don't use HDMI out on this machine.

Oops, I meant that I also enabled:

CONFIG_SND_HDA_CODEC_HDMI_INTEL

Regards,

Arthur.
