Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B34320A0D
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725552; cv=none; b=mIIlsESruZSLYM2YNPeuzwsgtowTSluos3DJBLjtae5GlRidetEpAsH+O5fP0GKAYLQyGuaFDiMCLJ5f/IZWQMb8uxkniauX2KAmbssrP3Kh3iy/WIODaGYdEqgAgxeVQ2toRIch9HMSy1DpH2qadaaO3MyoADNEE9+x97ECcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725552; c=relaxed/simple;
	bh=N+KihEy8ICBO/XzdSCW79j5H/pwy5ZjLQw4UA7wLX1w=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HldsEbiqYTFtKImUXPXS6AT7+oCYYwZ2DbosmclRHJYn331q0wSqiuqA1k435osaoJzheheYyk2vJ9jNAOrqkF7It5sHZ4NDVBIwFhR2wWwbaLgEXWx14Ei3m2Tn5oeFZRhBOjh/7XJE+vxHlYB+EaTjxERx2xHT6Ui4ZnUXeWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FAFbvmaV; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FAFbvmaV"
Message-ID: <c6a869fc-8b4a-4311-b14e-28a131d6a706@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761725547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N+KihEy8ICBO/XzdSCW79j5H/pwy5ZjLQw4UA7wLX1w=;
	b=FAFbvmaVexEsbrLB3TrUDM12fQqdr8z5fIXwOD5UYP07cwll+xC6AtYktFfCY+VBb4v9Ok
	qe6ntSvNColFxEEj/lVcEiOXA5QZpHH3uwP7OscTu8DQrtL7R5Walq0OqYLPoCYrot3yJe
	vFDQ0BZ9wiW8c0oXpGoFhOZhacltpcY=
Date: Wed, 29 Oct 2025 16:11:56 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jun Zhan <zhanjun@uniontech.com>, =?UTF-8?B?6IGC6K+a?=
 <niecheng1@uniontech.com>, Guan Wentao <guanwentao@uniontech.com>,
 Feng Yuan <fengyuan@uniontech.com>, kernel <kernel@uniontech.com>,
 Cryolitia PukNgae <cryolitia@uniontech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Subject: [RFC] sound: add uevent notifications for jack events
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

I propose adding uevent notifications for all audio jack events in the
sound subsystem, including headphone and microphone jacks.

The kernel already sends uevents for certain jack types like HDMI,
demonstrating this pattern is well-established. However, other common
audio jacks like headphones and microphones only generate input events,
not uevents.

This inconsistency affects userspace tools that rely on uevents for
device management. Adding uevents for all jack types would provide a
uniform interface for monitoring audio connection state changes.

My proposal is straightforward: extend the existing uevent mechanism to
cover all audio jack plug/unplug events in the sound subsystem. This
change would maintain backward compatibility with existing input event
consumers while providing consistent device notification for all jack
types.

The change aligns with the semantic purpose of uvents - to notify about
hardware state changes. Physical connection events naturally fit this
category.

If there are objections or historical context I should consider, I would
appreciate hearing them.

Thanks.

Best regards,
Cryolitia PukNgae
