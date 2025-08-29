Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3C273F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 23:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756510679; cv=none; b=i5AT2r2I8GpruEyGL8lLGkOxi3Un3u910y3zQOGDDQDDwAgFbzr2iViSc4+nU5Qiq7eFMFRvuKldVZh8gOKwzV+fdaOJAcRyoK/xjfIuqZLR5rJ4YGi8VKXd3t1paMVVla+MW9wOreRsoqbxjd7RkkLB0TOua68RDeRMMDv4WhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756510679; c=relaxed/simple;
	bh=Kkc3GFD5/Lo48b78pGUwuGKNmFAGohKvV5ddl69ZqHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XVPzjxsl7QM8N2yZEK0+lz5xwlWZNYIWHL62nRi0vO7Ynej7ZpUF2UgBoBpEaPesv+C4MlS12znA0lJNVXpXGqF4NwHWeYu9T5kr5/xSf0H+Cpp9HIwQNYQGd9IG1aQk+HcQwLzU1bbrZTkXKoxkVrkgsS6cLbPWV+fth1tyYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=C5DkJV6Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m9DqzBlh; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="C5DkJV6Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m9DqzBlh"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A43F57A0193;
	Fri, 29 Aug 2025 19:37:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 29 Aug 2025 19:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1756510674; x=1756597074; bh=OBZire+HLo
	F5CIwo8rPhnFzGNSQae0tGQzr3KTl2KSg=; b=C5DkJV6YQQN7Ru8Wl+R8q0gdh9
	+wr8eQZMvLNWMBS8s1sFoED0DITXITI1k4OVxnZqUNT65PzIuZrnukns9aNRg9B7
	mSMDZ6kIPWi7eIC+BVqhWHzGt83u+cZb9LPZ2IhLATja5zpmOCvR88LcaOlrpx7r
	708g9GG709JDgMnKkjXR55SEtqmtxO/mty4j5mnJ6pt2uUCIgdUocFV04duith0H
	D7rUwlTKzzan/JRsyoMeAiAE3V3xzejHtKxX8KoA25lSgzhzhZvoyy4tsvxz5f95
	pjX7VcneYqpCKPkFVETRNIbEqC6w24RlKGn/TjymkwhZLcenjLBaYqNC2sug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756510674; x=1756597074; bh=OBZire+HLoF5CIwo8rPhnFzGNSQae0tGQzr
	3KTl2KSg=; b=m9DqzBlhMMQ0IPC36ttzqqeMkBeZZdUf0WafoIS9vLH7BzrQ6dY
	qtZHr/V0TYSiOtCj3p/v9/C+SILR1qgyvKJPjMpdjKk3HiGm8OVBZTcN5CWEyBEM
	SHmuuI28K/uPmE8CuEGUoV622/FDA8ZZOhTVanGNKsWHD9ILvepD3pwj0aYbZhFo
	zNhZqyVSSRoR1uP9L4InIkXKU5ZxR7vA8W/srmnlZTSxpGuqBDZSDOnAoa5YJU+a
	nsoxse8qMpIP6KNJ57fRI9IVybY/Cf74PotrIH2nEbUGD20zJlzHqhLbBAc2WQG4
	wWOVY6s05cjZ5kQ3WoTshbyR52k9SMDpjKA==
X-ME-Sender: <xms:0jmyaEvSe5fbL4nP_d0OuMMDagfPJA45dTNOXnK4lQC27-MNUdfh5g>
    <xme:0jmyaPY0ps1QMFDwwYmcJksSnV1LVdvX0SC8C5hzZoY8yXIWtdLaEwi9Omp4n1KEm
    J879KCCy2ZiyhIk0Ko>
X-ME-Received: <xmr:0jmyaHUO6PPPG7wNt7-zkpVeTHcGZgeMKaltfo_AcnlBQD1lb28ovtepfhP7VXDeDs3LQJarwgMR3ZyThFKDxMdOp5c0jO4CiZwb7ybj7ONL7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeegkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffveekud
    fhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
    hmohgttghhihdrjhhppdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqsh
    houhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0jmyaD4xP76ME2jXpPA5t-DIGkUgnBHIcwKSJpkhpB6i5HKceEJK0w>
    <xmx:0jmyaChe4ssaosv0BKqWucx_8luWnU_oYMMVbYWZa00SjRbLIZe_NQ>
    <xmx:0jmyaKf-q17ZdHYEa5Dv3f1b2oawvlu5dUk082cMNTINJ6aCL5wjKA>
    <xmx:0jmyaHd_d56i37hsvLP_c9BW1CtICE1qlHK6LA362ga7iX2h0-ibYQ>
    <xmx:0jmyaHo9aas6kV2LNVtS-x1WMxNthq_vrqDMvaCWF1Ds6TIneZ-4SyCz>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 19:37:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: firewire-motu: drop EPOLLOUT from poll return values as write is not supported
Date: Sat, 30 Aug 2025 08:37:49 +0900
Message-ID: <20250829233749.366222-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ALSA HwDep character device of the firewire-motu driver incorrectly
returns EPOLLOUT in poll(2), even though the driver implements no operation
for write(2). This misleads userspace applications to believe write() is
allowed, potentially resulting in unnecessarily wakeups.

This issue dates back to the driver's initial code added by a commit
71c3797779d3 ("ALSA: firewire-motu: add hwdep interface"), and persisted
when POLLOUT was updated to EPOLLOUT by a commit a9a08845e9ac ('vfs: do
bulk POLL* -> EPOLL* replacement("").').

This commit fixes the bug.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 1ed60618220d..fa2685665db3 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -111,7 +111,7 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 		events = 0;
 	spin_unlock_irq(&motu->lock);
 
-	return events | EPOLLOUT;
+	return events;
 }
 
 static int hwdep_get_info(struct snd_motu *motu, void __user *arg)
-- 
2.48.1

