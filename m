Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0E18FC67
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723129082; cv=none; b=JXwk5p4q1c2X7aoFMHwXhzMcnIseiqA6fZule7SpKqTgd7haciNjr1AU9L6Z89tBpUSO3Yzyfj96eL/6wjTW1+Spn30QBzXBA7QgTSZLRmhG2o0FPZWQZLhMVRhBDt6PwrbHqbAPgAOQ1+Y3vuTMsQ8VG+tkI1b8Nc+KfhZ0yZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723129082; c=relaxed/simple;
	bh=C1ZFQfUePYxAYCqmKVS0lTNEqCwkGb0ZLe5aWDLCXns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4V9USakWGZruBMoAsZ+AOZPuL5EY4mJMY83g9FsBLNZKxx8sc7uwUqrOh/3hU0OCqCwzkTV8H8Hq3PbKR3CgTmPhFn8ERsgEdAurYscv4fjlj1tk7JxCa+SnydsydSMBYoEn1LcTPl1kO++re4eKQ3H5c0Ya55QMtPidupaPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fruR9gVv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fruR9gVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723129079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=q1LD+duaEZT3r7HWPwHh97PcJWzAFfeNTcXbwr2Hx5I=;
	b=fruR9gVvUjhGDc3k873s5mzJrhpp2fe68E0XOS5HO0fUWUtrVgRp4KZ7APXVLsO6LUgg32
	r7n/w410NvwPOsfY6CPEBpTSsyOxTjdNhQvqnnSYOnL1QAFL7wfKOdDuKnTN21P6ODg9B2
	DJZy+0FT8WzOHMdVCPYONXnSsHj1mVE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-wueuZ8ndOi-seabHp9nYSg-1; Thu,
 08 Aug 2024 10:57:54 -0400
X-MC-Unique: wueuZ8ndOi-seabHp9nYSg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0AD47197700A;
	Thu,  8 Aug 2024 14:57:53 +0000 (UTC)
Received: from asgard.redhat.com (unknown [10.45.242.6])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBADD3000197;
	Thu,  8 Aug 2024 14:57:49 +0000 (UTC)
Date: Thu, 8 Aug 2024 16:57:45 +0200
From: Eugene Syromiatnikov <esyr@redhat.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Artem Savkov <asavkov@redhat.com>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/alsa/Makefile: fix relative rpath usage
Message-ID: <20240808145639.GA20510@asgard.redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The relative RPATH ("./") supplied to linker options in CFLAGS is resolved
relative to current working directory and not the executable directory,
which will lead in incorrect resolution when the test executables are run
from elsewhere.  Changing it to $ORIGIN makes it resolve relative
to the directory in which the executables reside, which is supposedly
the desired behaviour.

Discovered by the check-rpaths script[1][2] that checks for insecure
RPATH/RUNPATH[3], such as relative directories, during an attempt
to package BPF selftests for later use in CI:

    ERROR   0004: file '/usr/libexec/kselftests/bpf/urandom_read' contains an insecure runpath '.' in [.]

[1] https://github.com/rpm-software-management/rpm/blob/master/scripts/check-rpaths
[2] https://github.com/rpm-software-management/rpm/blob/master/scripts/check-rpaths-worker
[3] https://cwe.mitre.org/data/definitions/426.html

Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
---
 tools/testing/selftests/alsa/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index c1ce39874e2b..0f204da9ea8e 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -6,7 +6,7 @@ LDLIBS += $(shell pkg-config --libs alsa)
 ifeq ($(LDLIBS),)
 LDLIBS += -lasound
 endif
-CFLAGS += -L$(OUTPUT) -Wl,-rpath=./
+CFLAGS += -L$(OUTPUT) -Wl,-rpath=\$$ORIGIN/
 
 LDLIBS+=-lpthread
 
-- 
2.28.0

