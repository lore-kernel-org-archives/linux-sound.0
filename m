Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571586;
	b=glbLBZu8IbQlNyXn7FNgt+6O5AGAQVG7lN8EsObDMxjduTpb0RxVfxxvg9Yw9OzAHG+3
	 dUMtgrc+q/DvqcgPlbpEYkYLSrgZ1E6P7BSMT+90F5Q6afDY9vkB+cGsxUXkgdqczIrrT
	 LK7XRLco72Bf02jCbTrGXfDwhHuHgSSbsBlhuX9itZEBPqRheh4yWz6/ScUh2GwlnJv6e
	 VcUSVqoH0Hk/k4VdlYNv1fz1uPksDO+JLHzTr6YE9VZwh3lVWY+AfkQKHvP6qATUVqwhD
	 WnN4hqnj7X4/tU7rNcnwMnM2lA5zwhs2EINAVDarhE47cI5PCWBb7NA+gl/4O3TeZ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571586;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1VYao4koAwSX4hSW1IXt33QK+RiuOZVq1Ws0kq4p5a0=;
	b=kpIIGGdRnnU1HtTvoGSk1pvZM5DqKw5V4F8zM6Jl7Da24B2Cvg7X9Bm7iIBxow6J5owQ
	 fqEmVQ2DvaqjIrJAVmi/RdhavweBRpOrTfqQe8xWXs3Ifengl9/2zvBye2pNQ8bG/xN+V
	 CRNO/PZsmvuCK6M+ixk6Qoth93oGlshh2zXS/ajrqQ0BftwsdKxQKfWeaLTUzYAOwoEgn
	 jIbpq2AleFYyT8HN8piavF3uEX8SsAYzZJB0hyNGedVLmN16DrgUp5D9G7icZjoLYYpvr
	 rGM1ZUy3/WL0niC9QwQ8cbTAdaYfMJC1qIrEh4kTaeqIK5uR/iQbOZ9eVuL6vBMesLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PeHFVDZU;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2788606A321;
	Wed, 25 Nov 2026 01:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2788606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PeHFVDZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PeHFVDZU56QXd7iVgzhtGzIOogLLrXifgZHedQN+D7WLnfqKJ7qCLKNS4dpSg/sfKYSpEa5PfTmgl
	 abRzgh2zJdo2PRFjs0DLlxNIVCHEkxjfi/APbVDnXPfKntRC/BZ4MGltZx57YupjHu8hON6um0s661
	 Fu8Pbxi8ksBWT7rw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b063ef1d02-4cf7d;
	Wed, 25 Nov 2026 09:50:41 +0800 (CST)
X-RM-TRANSID:2ee76b063ef1d02-4cf7d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b063eefd30-341d7;
	Wed, 25 Nov 2026 09:50:41 +0800 (CST)
X-RM-TRANSID:2ee26b063eefd30-341d7
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	Bard Liao <yung-chuan.liao@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soundwire: mipi_disco: Put fwnode on property array read errors
Date: Wed, 25 Nov 2026 09:50:39 +0800
Message-ID: <20261125015039.1818-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <awVT3MHdgD3MAxt3@parshuram>
References: <awVT3MHdgD3MAxt3@parshuram>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vinod,

On Tue, 24 Nov 2026 14:37:40 +0530, Vinod Koul wrote:
> This fails for me on on the current code - sdw/next. Please rebase

Thanks for the report. The mismatch comes from the treewide conversion
to the devm_kmalloc_obj() family (4dd10fbbeb9c): it rewrote the
devm_kcalloc() call in the lane-list block of sdw_slave_read_dpn(),
which the last hunk of the patch uses as context. The leak fixes
themselves are unchanged and still apply to the converted code.

I have just posted a v3 rebased on top of the current code, with that
hunk context adapted to devm_kzalloc_objs(). No functional change, the
diffstat is unchanged and Pierre's Reviewed-by is carried over.

  [PATCH v3] soundwire: mipi_disco: Put fwnode on property array read errors
  https://lore.kernel.org/all/20261125015005.1528-1-laixiangwu@cmss.chinamobile.com/

Thanks,
Xiangwu Lai


