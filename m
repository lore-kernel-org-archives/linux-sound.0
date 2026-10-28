Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153185;
	b=el3SYuw1w1V1vsdH8ycV6ep9jOsqE75Iq7tserjKfbhdzU7wUAAHcNdpMHuZjLAjj+h/
	 ZnYbd/7iZpw3wWpfTMG8KdQ0p1lDAmORsPEQYUyJgao9bH9T1Z9/ffv3I6eYqcpI/dhF+
	 niJ3mvdKXk2krc6ux1vizAIRdJ6X2F+W/I7m5s5j1Jy7/JGWKWNZyChj2ECR7X4vQO1Jq
	 +I3/hEy/Ug1ASyZXH9RO/6oPhTZi8xyhSY6q9Dqc0ErEN7xeWRWR7TXbwr3fCt/smJw8K
	 rMKAbNZMyCoJGbKypyNM6uTE7lqKoPP8SQ4bQffd0nBSfhzx2jEPNQFtJLVwN+6K9ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rFXGahheBfGsbdZW2guRWVQDxiCmM4saREczsmcRvXM=;
	b=i8YJgSBBEpNNuvsXHcHNeZ86/REqO3ygUpGwV0jKQRGjobLCd2nBQaJQGnO2M5LsngX1
	 btQKBBr6SiKfDchK8LVc6eDgiVqb9XT6R0KMEjiBcOieD5vBpIo96K37M4iPvFBq5mxCt
	 JCoi0Vr8lK77co7uAidZu0R47ABgjg/yHb6BdTok0sYni0Mb7cLiVjqL4O++OSvJqAZ2F
	 qDFGnFDTU4Oj3hwhQZjF+8LVAd3CFu6VbmkK6ARh2zyc6ssjKoae8BLrvji0SdCKCI9WJ
	 Ozji4X858BsORPwMi+uS9gfSwkgK/QWvkeZzRAaDjjJozoeZfuwpol1y0/ahu+dQ0yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY1nRHsg;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E503606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E503606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY1nRHsg
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af81963f35so368017b6e.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153184; x=1793757984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFXGahheBfGsbdZW2guRWVQDxiCmM4saREczsmcRvXM=;
        b=aY1nRHsgjytp/s/3eXK/PFj4ABtVCz1074NwCnLx6+YmFqANujqdJb8z+tL2Stl63Z
         XjT5v5TZANPDWJQqfiLh4IBqXS4lMGlLGXEDqzrpwHNUNkqthFdKzkbWq0hROd1fmn/v
         URtz0ApKxIULeqb4Hz6aEvw+09JnLTGWG0WU7IhBMVmSN2P1ej2iOobqChKV3+5AnCPv
         3RANexRp4CpwhqRbnY8PbQlNP8JrWsIPgxywa5LHQMkxAfqAXHCu0DYTL5DhpUPthRcO
         ar3Tsl7ShV1uebYPoNGPzfGQmFP5Na1UoOh997V1y18HBZbtvlh7DQ435fJ7371CPWzJ
         9o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153184; x=1793757984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFXGahheBfGsbdZW2guRWVQDxiCmM4saREczsmcRvXM=;
        b=GUf9FfPezN+kWiODpuIQPSK1KjVlU00SuVnD7qVgEe7k1dty76he4H7rMZzJBdgaHD
         XeQCrNLKDO7vS2hovLtputBYpqMaQtcQN5pee9rGK4L80AqhqklJee7a1oYGOOl+psMF
         Yr5t57fK0XXNaqJJeoJ0GBDBESB8AgIzEDkQ5/dO2O2djlzYH+6Cx2SnM4JmcVSLcYw2
         tHE7d86lsaoZbIKw21WKQ2ITUBQ4noX2je8Wyatk+Bi92iPmhpt08TqbzDeuBXtzrUFk
         RWJYrdOLPbRemi9zDuSkJ4jeUeNjmlSxmsRL5FlymOGUBulBZnowcQFVOTAopo8VhwGp
         W5AA==
X-Gm-Message-State: AFq9FYIoVk97A+TUOHxW5LTsyMzsdGCTqbSedLw2ceIIwYZxMvLhljIx
	CGfbCwDTCVcd2MjYLW9Tw0rZSe+yVrcHdmbkXtXWQiyAAt+H7g6WM6qv
X-Gm-Gg: AYBFou0gR7GYN1v+fgYveVFXeB5Ck94sGITfsWpW9Gtr2hcup4kqf2PSi1mZpU3FHuW
	njryF6vK2wtTu7PbsGqhWSCxZMhN/KnTol1/GrzPGXCuDpRZE9WDPsFRILJIH9q9gw71jiJpVPv
	W2GAOOT0RNr+aj8aXlxMU92xlhXALPOeofAkNhNUEAgIX3Pjx7+UOD3svI4rA1EIGn3LxEhgCGx
	1+tTRdBDZdVuYFrzAHjnSvSEPVtLBSJJ3gxPxFwDfXIDwRyt9kwaZGd8nPyeewZ/8B1CvqzpZ15
	1uq8HRHWBxecV8daIsyGt9b6aQlwTpdP78XY/Mt7h8Yg4cPBeF/EK3N1hqeyLdXuGVuW9cOW4N+
	/Fh3wMhIzfJF723AGKQvznqkk69ABm9LVB2JlBU4A9jEcNFkeaexImYpfK/yKvdWxtT3Cna82AS
	XOPGvvTpU/Et09nwCIMN6fvwNPQBcLvsb/25eQ3TFS+wvyFiO8Bg1THIL9m45KIa8BsmUO8jsfe
	QcUxpQF+ZYAp20P83h2rmy4he4O3U45PgJVN2yA7fzXGm++SIeXkhVOspg58EN6vf3uGOpZ67qM
	0NXguT8YVDw1tx7ANjWuXPqfEhwMy0kXxm2nrKBQJnABhMv+PYaUMGLtp+Z7h72GkwoqfEaTbyT
	sijssOjMhqtIi+OMqZs1QXl4=
X-Received: by 2002:a05:6808:1927:b0:52b:7641:33a6 with SMTP id 5614622812f47-563a205edadmr452625b6e.14.1793153184361;
        Tue, 27 Oct 2026 19:06:24 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:23 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 4/11] ASoC: amd: ps: support ACP6x in the SoundWire DMA driver
Date: Tue, 27 Oct 2026 22:05:45 -0400
Message-ID: <20261028020552.35278-5-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
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

Extend the ACP SoundWire DMA driver to the ACP6x revisions, reusing the
ACP6.3 DMA ring-buffer register maps and stream/IRQ associations.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index f27ebbd..196642b 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -247,6 +247,8 @@ static int acp63_configure_sdw_ringbuffer(void __iomem *acp_base, u32 stream_id,
 	u32 sdw_mem_window_offset;
 
 	switch (acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 		switch (manager_instance) {
 		case ACP_SDW0:
@@ -360,6 +362,8 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	stream_id = stream->stream_id;
 	switch (sdw_data->acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
@@ -437,6 +441,8 @@ static u64 acp63_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __io
 
 	byte_count.bytescount = 0;
 	switch (acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
@@ -518,6 +524,8 @@ static int acp63_sdw_dma_close(struct snd_soc_component *component,
 	if (!stream)
 		return -EINVAL;
 	switch (sdw_data->acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
@@ -564,6 +572,8 @@ static int acp63_sdw_dma_enable(struct snd_pcm_substream *substream,
 	stream = substream->runtime->private_data;
 	stream_id = stream->stream_id;
 	switch (acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
@@ -777,7 +787,7 @@ static int acp63_sdw_pcm_resume(struct device *dev)
 	struct sdw_dma_dev_data *sdw_data;
 
 	sdw_data = dev_get_drvdata(dev);
-	if (sdw_data->acp_rev == ACP63_PCI_REV)
+	if (sdw_data->acp_rev < ACP70_PCI_REV)
 		return acp63_restore_sdw_dma_config(sdw_data);
 	else
 		return acp70_restore_sdw_dma_config(sdw_data);
