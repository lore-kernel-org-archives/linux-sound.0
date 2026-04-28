Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E453B5826;
	Tue, 28 Apr 2026 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362295; cv=pass; b=dQ7whcF7xl2BTyrSsMY5swNdsMWlxTmQRfaOqlOwqb6a0a8S4zV9likneT728R3NbRwaQ7Fp2E+ixe8TY7B35mee9jWvmOJ5MC4WpghluQNCZZ1sop7MmqJIRFGEHzJ0Bt48iYlv3CFbntfnyFfqUEgtaVuVKk3+6aqgNeuYC48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362295; c=relaxed/simple;
	bh=aSlYiThN314JtSIdBPA5gv7QtcuqUw3NsLfDi0KAUk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXLyDlnyK5GRic/QtD0ALTwPGuzMywwpuKvZmiPoKX0XuapyicfYuALh8wNCaRo78pMjFgh5sfrSs94BhILpRLJPJ7vp0HHyMcMZFDlNmp7heW4d2YUpQwMyRGNFywf8Loe9YC+Nc7d+/YlNziD9O5VGrDmNHtln+wcxrBtu90Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=YIL9xb7c; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="YIL9xb7c"
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1777362268;
	b=BycuQojgkVg8FQUBNr0pAc+zHUC6SLK0oKktpzHdzPuYollaKlxLdHDM9Zqw2zrBl52O
	 NrpC1vJoaDZjOQcwcnX3vMnzyuHi6z3yki/d7q443nnl89zK1lVE4irDj7vZNF2J2SwHg
	 gczcaPjUE/n3y8DkjzmEfbA3p8D/bcE0Dk=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1777362268;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=oaqB/2eox/BDkgs1hqLWEKq+prT8zf4FLH66GF7uTWM=;
	b=CSCTZ6vLC8iBIyucA2EO8zi0Piwszmh7CDoqgOxzQoHECCegPJYF0G9SpRyhIY2xuth1
	 aaZzz4cGZTJaSHynStIAknBHr10L6CdqBSkE0Qom+yOWWjKfs+cMu6pdvCnIVuPURbY4l
	 e8wy2Z9GOMFWsbbYxi6/zqznJTF5XZnKgY=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63S7iKsY3237512
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 15:44:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1777362268;
	bh=oaqB/2eox/BDkgs1hqLWEKq+prT8zf4FLH66GF7uTWM=;
	h=Date:From:To:Cc:Subject:From;
	b=YIL9xb7cZ97At2e0i4Ew79jOkN/WXrTuLg3bJ8ihg8fILi09NQY10eJdOhoefsoOO
	 g6i04BsrIdPqT9VyRbjTAy85yCa4huM0TDZZdW1nATy6CursaatIiaoKONCTqxPMK0
	 g7+miRnaR3CHuJuMBqfdbtPUJvZBNmOik4otuD5s=
Date: Tue, 28 Apr 2026 15:44:15 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: hda: Fix Cirrus ACPI device reference leaks
Message-ID: <20260428074415.GA1632446@chcpu16>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Env-From: sfual

This series fixes two missing acpi_dev_put() cases in Cirrus HDA side-codec
ACPI lookup paths.

Patch 1 drops the lookup reference after synthesizing the companion in
cs35l56_hda_read_acpi().

Patch 2 drops the lookup reference on the early !physdev error path in
cs35l41_hda_read_acpi().

Shuhao Fu (2):
  ALSA: hda: cs35l56: Put ACPI device after setting companion
  ALSA: hda: cs35l41: Fix ACPI device leak on missing physical node

 sound/hda/codecs/side-codecs/cs35l41_hda.c | 4 +++-
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)
