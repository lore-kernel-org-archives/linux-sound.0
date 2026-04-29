Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADCF35AC3B;
	Wed, 29 Apr 2026 22:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777503479; cv=none; b=Mj2XJU4goVUpVzld22npoVpRdqw4QCi24GDvbZ0qv3LaPHxuMOaf5tC0o7/fh2CEn4lgdwJCl8euZurlGlHIXbGZRiE5JT60F/8isR0dP60vej7nMMgOillsPsOL3YnrNLLxlTv2GzdYQBADBskc42TWWaayIDVJqdRbSLLaJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777503479; c=relaxed/simple;
	bh=zIsXCGXRvHEjkLFxx/D0QluBX4QaPwS9iqZP7TxCeuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iesbE1Y4rGMKepxrTQ6AZMZ/WDxmzUCoSix2u99BzShlX8z5102gA0kpYjJOR4UuhIWX3hiy1ifXpMbUmQSQ5I0rjz7tTeJAof/Dj/Xk17LR3oBTjtyNsOHhdQwE05VFS2lxVrsVUJeuNA7qzmjCw/lDfOK45UlDtKgcp/ZNeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m7g/fXoT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m7g/fXoT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bvfCCGjIsytxB0DaPhBA2XH/4ziXKHOu0BtwvQ/tlhc=; b=m7g/fXoTGGRLr5GpVhSeZiHQ7U
	gpVYIgUA7FsGgZp+Avzsw0AI1XDSU0CfLZA6v5oUJRdEGXDhcIUYlMe13/kP1JgyXad7Fms3dWNUj
	Ea8GU/Ee7fuxMIZjMkOQNdND/ztGfm3rFOVQDxAwi69fkuq8aK+1U8YWsAg/Ptsai5A4+I+UEJMv6
	tHbO49YRu7mFVQrEAK5x9PJY8rjd8CTRPmS8HvIQnWvu8uTQBk3vvITLkFl32i3CtaI+z8GmPFX1w
	csybfwWnPHLAim2gZtuQPqY88jJxxEfTJW++qaVN/izY0MNifzcou7gUIKRqRwxo0OGmBVyW6JJSe
	mQS1nqow==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDqq-00000004IEB-3bsr;
	Wed, 29 Apr 2026 22:57:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Sen Wang <sen@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] Documentation: sound: fix TAS675x doc build warnings
Date: Wed, 29 Apr 2026 15:57:51 -0700
Message-ID: <20260429225751.1995224-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tas675x.rst to the index file and extend the heading underline
to avoid build warnings:

Documentation/sound/codecs/tas675x.rst: WARNING: document isn't included in any toctree [toc.not_included]
Documentation/sound/codecs/tas675x.rst:659: WARNING: Title underline too short.
Overtemperature Shutdown (0x87)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]

Fixes: ba46edca354e ("Documentation: sound: Add TAS675x codec mixer controls documentation")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Sen Wang <sen@ti.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org

 Documentation/sound/codecs/index.rst   |    1 +
 Documentation/sound/codecs/tas675x.rst |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20260429.orig/Documentation/sound/codecs/index.rst
+++ linux-next-20260429/Documentation/sound/codecs/index.rst
@@ -7,3 +7,4 @@ Codec-Specific Information
    :maxdepth: 2
 
    cs35l56
+   tas675x
--- linux-next-20260429.orig/Documentation/sound/codecs/tas675x.rst
+++ linux-next-20260429/Documentation/sound/codecs/tas675x.rst
@@ -656,7 +656,7 @@ These faults place affected channels int
 issues fault clear (register 0x01 bit 3) to allow recovery.
 
 Overtemperature Shutdown (0x87)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
   ========  ==========================================
   Bits      Description
