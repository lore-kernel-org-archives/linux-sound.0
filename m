Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791835;
	b=5Eh7zoRzLkv88sQNxbhzaW6L8Wm1oJN+v9XSrpoWjRt+lrTEy7veRzKjZwUOiyT6c4ss
	 /R5TZifY9mw+RhNvTBM6Fv99wJuh/bDX8c+UzgbPU0cAMgumOzokUpY2bCw3CSCiKTTwo
	 731HE5o+gO5q1g4/VGvYUSQgxzjGxz7IJE656+4Mr2mHYOtPoGyqMXSctFQ5OBGHo0i5s
	 HQD/YybLlE5KiZfWvDarthDxFlvMbgrjV8o5wdlz2M0gAgnyVB1Q4HzIGwGmz1JtoO5LW
	 3BCdsysMlM0c9nQ+1pKSKFmZ/3xPUnyt5DK6okyWH6KndH2mVd/PCa1qU92NrtPw4PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791835;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:DKIM-Signature;
	bh=wXpHIrqLKwMrDy66ZK+WUvXNBJY8f+ZNukkN+Nd1/8Y=;
	b=2Bm31zzeqlrrkB6xENqJwT818xIKgHQxXHNiCv/LO5yITKQCGK1podKySZU+PZaStnvq
	 TAXUAEnOG7oqqoQYChlcutYsSr/jifYoY/aVfJQtMyRP3Gxt+ioQkE4n3zGlCYW0k8Nbz
	 c2eoVkWxXSOkQdReYPSabQ+cjdcTO14x1op6UJuaolZbEP2DqrD7EWo76XugLUdzJ3TG9
	 dpiRJrULX+AHAMCuJaZlQDDm0nTZ8UYSGWgIH9rRnw8tWAvvezfexpY001ttLtgTMOjfB
	 qAW/AEmBSjVyaNllxFbW2n6u95KNxDEdPh2zPQBwImLhvnCYEw2n53KmT+6FFwLIz0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=SFaxSMj9;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D9606A321;
	Fri, 27 Nov 2026 15:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=SFaxSMj9
Received: from abreu.molgen.mpg.de (g44.guest.molgen.mpg.de [141.14.220.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7F2134C442F954;
	Fri, 27 Nov 2026 16:02:11 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soundwire: intel: Suspend and resume the links asynchronously
Date: Fri, 27 Nov 2026 16:00:57 +0100
Message-ID: <20261127150101.48880-3-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127150101.48880-1-pmenzel@molgen.mpg.de>
References: <20261127150101.48880-1-pmenzel@molgen.mpg.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795791731; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=wXpHIrqLKwMrDy66ZK+WUvXNBJY8f+ZNukkN+Nd1/8Y=; 
	b=SFaxSMj9Kev6cXq0ayE0euMsS/ozUf1D603wFrTA/ekHgXXCKcJjuMjHLaYDIoR8VCbc9EZGDMsy
	sADLwHBXbW6FV3HHeviO6VffhX19m3CyksyC49slg38SlH1cFXE45HuSqkoQB4Deu1iaZwKDgXouMg
	nwUulo0MHvYWKTvaEboq23c/KRVk6VJvflQy8JiasM4Uww0blsCTBnuVGh977aBZwxcfAzEWx0eA7w
	2sv0M7Ikb8IbQ00gJKOqLW73QemK3QzFQrY6MsS1zua2pxOIaPOw10iiw50gzRHOUqg6Pk9FzQ2Ktk
	LZ2OTiVv0MB46PvcqlB6EBVljmp1+kzw==

The link devices are auxiliary devices of the audio controller, and without
the async flag the PM core resumes them one after another, and after all
synchronous devices before them in dpm_list. Each link is the parent of its
manager device, so with the async managers and peripherals from the
previous patch, the peripherals on a link still wait for the synchronous
links.

The links share the SHIM registers. Their accesses are serialized by
shim_lock, so link power-up stays sequential. With multi-link
synchronization enabled, intel_start_bus() arms the link in the SYNC
register, initializes the Cadence IP and triggers SYNCGO, which releases
all armed links. If two links interleave there, the first SYNCGO releases
both: a configuration the second link has already written is applied
together with the first one, a later one right away, and the second SYNCGO
finds no armed link. Runtime resume, which goes through the same arm and
SYNCGO sequence, is not serialized across links either.

So enable asynchronous suspend and resume for the link devices too.

On a Dell XPS 9315 (Alder Lake, SOF) with one codec each on links 2 and 3,
the resume callbacks of the links and their codecs now take 17.1 ms instead
of 28.9 ms (median of five s2idle cycles each, both patches). In 49 of 50
traced s2idle cycles, the second link armed 0.06 to 0.32 ms after the first
link’s SYNCGO, because its power-up waits on shim_lock. In one cycle, the
first link’s worker stalled for 0.65 ms after arming (moving from CPU 2 to
CPU 4), so both links wrote CONFIG_UPDATE before the first SYNCGO, and the
two SYNCGO writes followed within 1 us. After each cycle, including that
one, playback to the RT1316 and capture from the RT714 worked.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    The analysis (sleepgraph device callback timings, function traces of the
    link start-up), the patch and this commit message were drafted with
    claude-opus-5-5 (Claude Code), asked to cut the s2idle resume time of
    this laptop, see Documentation/process/generated-content.rst. The tests
    are in the commit message and the cover letter.

 drivers/soundwire/intel_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad48d67fa9358..7fcfce0d2133b 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -98,6 +98,9 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 		return ERR_PTR(ret);
 	}
 
+	/* accesses to the shared SHIM registers are serialized by shim_lock */
+	device_enable_async_suspend(&auxdev->dev);
+
 	ret = auxiliary_device_add(&ldev->auxdev);
 	if (ret < 0) {
 		dev_err(res->parent, "failed to add link dev %s link_id %d\n",
-- 
2.54.0

