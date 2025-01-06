Received: from omr012.pc5.atmailcloud.com (omr012.pc5.atmailcloud.com [103.150.252.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928633597F;
	Mon,  6 Jan 2025 05:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736141252; cv=none; b=B9zTUmwt2/7OR/XqnT8CpjSdnq8bh4tEQr1hpfPt98a0AD3SDp5rDYrTfH3qCOda9gERhuA1H5veXhE3u25y7GSfoCls40ILVEmzqs1f+rD7xWeyqR0Bbltu+kqiG6VGGm5l8ry/f8CGgqE8O+KeMbe51o+/x4ZsY5ARK7ptVco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736141252; c=relaxed/simple;
	bh=TtXRGO5Lo+39grYpYi1DIDPcw71E039d2imsvMHDt5U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XiIGHsnehilX/zmLwP8/OoiJX1CiGjuvlKkfU4ZvKecRi8LB55mMtUpIgXIrE9oklxDw/nhzSRHtcIYilz3utRA9lm/Vu/rNXua/C0oHCUP5sDSU01f7AffMTT38EW8Q47bLc2WS7NOUp5BmAF5/+XRxeR43irAMpCAV4wFbPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=EqX82IEL; arc=none smtp.client-ip=103.150.252.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="EqX82IEL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=MIME-Version:Message-Id:Date:Subject:To:From:
	content-type; bh=5q8oq9/F1i050T0Dqn1SCxEibAWCcXcEZwOR0k/UKAM=; b=EqX82IELuxRh
	rttHF32qC0QbT2CWE3Qz8yjDMuCzZwBki5F3MiJhPWTlB5lCiwyOgRyfwh3bIpTikPiqyl3h0m+u9
	BCA7hb0IHjDAIzVtPAOe9Vyf8/BockZ/5cakyFyRQVfesmo4ibS6WsJK9QZY1MrvyMlwv7P1mqEkf
	0jOYmLWMBRlDZ8m1Ybxy0/AwS4dyVNVvxoUdxYCYCdNlxg+vmMUS1Lrot0jODdLbfgmleJ09dfoJz
	U8nc6oKn7vSJhx5scB1MZVZfQ8fwDbn1UvcWKX22LCVyqvSNMVLVVcL43Vp3KrZxfzl33T+b89c8o
	FRJ1YCMU4IgcKUd0W8qxuw==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-01ab443d0bcdc103a) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUfKS-0000000009a-2upn ;
	Mon, 06 Jan 2025 05:07:04 +0000
Received: from [220.233.184.101] (helo=localhost)
	 by CMR-KAKADU03.i-01ab443d0bcdc103a with esmtpsa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tUfKS-000000003YC-0SOf;
	Mon, 06 Jan 2025 05:07:04 +0000
From: Stephen Gordon <gordoste@iinet.net.au>
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH v2 0/2] Minor debugging improvements
Date: Mon,  6 Jan 2025 16:06:57 +1100
Message-Id: <20250106050659.57924-1-gordoste@iinet.net.au>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=b7W04MGx c=1 sm=1 tr=0 ts=677b64f8 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=VdSt8ZQiCzkA:10 a=x7bEGLp0ZPQA:10 a=YWcv6D1QBWZc_22Xm0QA:9
X-Cm-Envelope: MS4xfCQTU+3e/FYSV2sSjN7vxoj1LxT7MSk0f+k/tEFw3utwmFfbyEdK1vk1DM7Dev52/x2KcSlv+N+SVL+fxqo4u808fA05gCv9NjUgaBfeJ+E3zuYcXwgn 3ogEONhngjcIZPp37aTYlFkkDN0ffR8FlRSkYYdAauiZzUYcxrld6Ddq4b4Ct1VSyXgKMeIpNNAjfYM01+czsSu8J72xEyoNntM=
X-atmailcloud-route: unknown

Some minor tweaks to debugging for dai_links.

Changes in v2:
- All: s/asoc/ASoC in subject.
- Patch 2/2: Update wording as suggested in review.

Stephen Gordon (2):
  ASoC: simple_card: Improve debugging messages
  ASoC: simple_card: Show if link is unidirectional

 include/sound/simple_card_utils.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.5

