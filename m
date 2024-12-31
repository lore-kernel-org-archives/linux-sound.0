Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2022F2D;
	Tue, 31 Dec 2024 03:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735616366; cv=none; b=Rl4T1KLeok2zSl1GmfarIYMH5rioDkCudTJQ5KlZ8BkQauxampps8QFYhAbJhBVT7XraAPzuL0AwGmZg4mLrzKARzkILc84jhOXy/JxXkCx3914XMsx6tQTs+uCDy70akaJMFCpnJlgWLCahCv1CRhr9ulbAREHil0aLuMPE5nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735616366; c=relaxed/simple;
	bh=ZxWLPDviYNxDGsTVL0Iunb2rMCmYmfIK+VOuMMc1240=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MuV0nFcXMu7G+8zWHUxueHYFE0SqMm/zV20H8dcPHZOcYsuvDo1ADJIjzLPFPq2DT1/Olob2+27tqfAROn/fW1vd9o/oryxe8aXJpWMympGB0/f7I57Rziy1vO0sqTEbTW0j86nXds7vDszSGyVmZbLnRqK4kcy6XDGqvKEVwH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=mqs348Gm; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="mqs348Gm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=MIME-Version:Message-Id:Date:Subject:To:From:
	content-type; bh=aYFFXafFdn/UWQUxUayn95kBKM193dtZjA2S97WeIew=; b=mqs348GmGyKC
	ihUuhYuycLbv67Ir+ikkalU3tcldGQr9emRTuTNXwPLlh6U+62KNajkmc5//2xZ5IlAEl0xb7u7hC
	Q/ta69kEyhpuYPMgkO1czECQ2/8JJXAoXiHzsiRDrVZ12ESHWj3YOTUKDZIGTetOG2tcQPl9316xo
	1yNjBhMw57tcETZ3uEwnXA3k9MGauZ7XO1RT9O4yxM6OVijXqN4mahipX1lAG5R4/9la5PnTwVk4N
	CN1VNqljvdOdmGt3BELBoORXbMIwIcIRhblEf+jLl1a1J6NMhfwRiC2s92yGqdiivzF0k/s5Wm0Oq
	tA4BoIAE9Pzv9k8+E2ZuTw==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-01ab443d0bcdc103a) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tST6G-000000007sd-0emF ;
	Tue, 31 Dec 2024 03:39:20 +0000
Received: from [220.233.184.101] (helo=localhost)
	 by CMR-KAKADU03.i-01ab443d0bcdc103a with esmtpsa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tST6F-000000003Zm-3000;
	Tue, 31 Dec 2024 03:39:19 +0000
From: Stephen Gordon <gordoste@iinet.net.au>
To: kuninori.morimoto.gx@renesas.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH 0/2] Minor debugging improvements
Date: Tue, 31 Dec 2024 14:38:39 +1100
Message-Id: <20241231033841.6213-1-gordoste@iinet.net.au>
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
X-Cm-Analysis: v=2.4 cv=b7W04MGx c=1 sm=1 tr=0 ts=67736767 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=gjNZ17yQc1zOlAvepeAA:9
X-Cm-Envelope: MS4xfFD3lVIfZwy3yGCY2Ams1SjpHBvTQLXHAkT9WuyjgxAiTSNJZd7dkC6wJEzNMfWzM2KMwdAthmFCAGE2csp7ZQtJWXP+5pPO/PDKG2Q4xQWrNaSmBUGM HdOAnUVSrelgJdqUdR4VdTIpZN3s8j1o6jrMSuimcNB6dDTdwCTuunUZKiA/rd8Vr7GrlPOD4a1ULApC4qIIV4CFtRi+ZvFlyHo=
X-atmailcloud-route: unknown

Some minor tweaks to debugging for dai_links.

Stephen Gordon (2):
  asoc: simple_card: Improve debugging messages
  asoc: simple_card: Show if link is unidirectional

 include/sound/simple_card_utils.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.39.5

