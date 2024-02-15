Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn [202.108.3.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732D6FAF
	for <linux-sound@vger.kernel.org>; Thu, 15 Feb 2024 03:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707968750; cv=none; b=Wn1jS2ECqDjCiYz8bvo8JKuszsMJilL4VYIuX+F6g6qwdGbAGnCH9mQuri9ggWVAqBlBvY87SU6LpfW5s2Nq9mQXZ9vCU1Ywa5JdguZfLLAvwjcaIyisC4cCMO8HNoV6/4hehfUdsAcFSm3dKU7CkRPchuyY6eb0b60h1n/zBes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707968750; c=relaxed/simple;
	bh=Pr7MlXtPo86/mwM5YDwntO9BuKQlpseSIwMVWLpanLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtjBwApOPlUhKa3wCM2SLBrvcEpyMlpixJNMnxTn3BcRcYNXoKWvQbDlgO+BcbPFlDDweeBGLXYHrknErSMOpFV8UVS++XQ9LjAyN86rrZk7Ha4HLgTKIxoV9czIgRUUYkDt8dX+J8g+R3fxDe4CJA1E/GBgqjHmZ6qB4YB72ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.59.61])
	by sina.com (10.182.253.22) with ESMTP
	id 65CD88E200003AAC; Thu, 15 Feb 2024 11:45:42 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2817766816217
X-SMAIL-UIID: 31BAFFEE8DCD4C388D6388F22D028CF1-20240215-114542-1
From: Hillf Danton <hdanton@sina.com>
To: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Sven van Ashbrook <svenva@chromium.org>,
	Brian Geffon <bgeffon@google.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: memalloc: Fix indefinite hang in non-iommu case
Date: Thu, 15 Feb 2024 11:45:27 +0800
Message-ID: <20240215034528.240-1-hdanton@sina.com>
In-Reply-To: <20240214170720.v1.1.Ic3de2566a7fd3de8501b2f18afa9f94eadb2df0a@changeid>
References: 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 14 Feb 2024 17:07:25 -0700 Karthikeyan Ramasubramanian <kramasub@chromium.org>
> Before 9d8e536 ("ALSA: memalloc: Try dma_alloc_noncontiguous() at first")
> the alsa non-contiguous allocator always called the alsa fallback
> allocator in the non-iommu case. This allocated non-contig memory
> consisting of progressively smaller contiguous chunks. Allocation was
> fast due to the OR-ing in of __GFP_NORETRY.
> 
> After 9d8e536 ("ALSA: memalloc: Try dma_alloc_noncontiguous() at first")
> the code tries the dma non-contig allocator first, then falls back to
> the alsa fallback allocator. In the non-iommu case, the former supports
> only a single contiguous chunk.
> 
> We have observed experimentally that under heavy memory fragmentation,
> allocating a large-ish contiguous chunk with __GFP_RETRY_MAYFAIL
> triggers an indefinite hang in the dma non-contig allocator. This has
> high-impact, as an occurrence will trigger a device reboot, resulting in
> loss of user state.
> 
> Fix the non-iommu path by letting dma_alloc_noncontiguous() fail quickly
> so it does not get stuck looking for that elusive large contiguous chunk,
> in which case we will fall back to the alsa fallback allocator.

The faster dma_alloc_noncontiguous() fails the more likely the paperover
in 9d8e536d36e7 fails to work, so this is another case of bandaid instead
of mitigating heavy fragmentation at the first place.
