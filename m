Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE22E371F
	for <linux-sound@vger.kernel.org>; Thu,  7 Aug 2025 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754536410; cv=none; b=T+8Iid8JCn0Xw3r3Qxgh2s4X9B+J8s/kCCs2ZQHq8WzZI7a5jwlDTFnReqlnIkvngz4AhQu5InJdZGZUvQhEY2rPIafMzaaCQ7Sxq95XXTO4S8GPY87Yz9J6oD+8/hXxupHUxiK56Nu6K8/qsYcUWoWfIvGt4Mg1It/q7lkdqAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754536410; c=relaxed/simple;
	bh=2UxkOAJrUuM4j7S+oPTuJXRP6EPILJvru59l6PY+BFg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=N49MNmqHEbqYvzYsgLIa6MrlK0tto0XAbzUJT4AssJC20RZCWmYDo50sNuybl4s2DORa3Gniig6EFDTLo53T5knfDbi2ijpqIGrDPT9W1I26pg8/VVHCm42Cy6wjYXcXk9Ffzpgs9B5/JVvuwmKfBfDQWEHIlmmTUMm+aMupikI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E6sE16NH; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E6sE16NH"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754536400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UxkOAJrUuM4j7S+oPTuJXRP6EPILJvru59l6PY+BFg=;
	b=E6sE16NHmDFHiaC7z/slpLU8mmfW+s8vlWoAmNUUp1wUXv8TsEUtFFfBxXhkb4Jt/9+E9h
	uTyFlQzb5rm7wmLDyRMyW5xrLv1czLtJ/Te7/9XzvHpMMrcOEu4LwVRXXfkpG18cNsSJCW
	LPYtJs7TaQfv2PHfxTsigYh5iXcTMUM=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] ALSA: intel_hdmi: Fix off-by-one error in
 __hdmi_lpe_audio_probe()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aJKQ_WhAfjKvfB6U@kekkonen.localdomain>
Date: Thu, 7 Aug 2025 05:13:06 +0200
Cc: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Joe Perches <joe@perches.com>,
 stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <20A9013E-EF3E-45B2-AAB3-EC94020EC952@linux.dev>
References: <20250805190809.31150-1-thorsten.blum@linux.dev>
 <aJKQ_WhAfjKvfB6U@kekkonen.localdomain>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On 6. Aug 2025, at 01:17, Sakari Ailus wrote:
> Could you use three arguments here for backporting -- the two-argument
> variant is a rather new addition and looks like 75b1a8f9d62e precedes it.

Thanks for the hint!

Best,
Thorsten

