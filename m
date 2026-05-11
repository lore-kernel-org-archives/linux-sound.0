Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0A53803C3
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484309; cv=none; b=luApY/rce06oWxkwIbjOrTwD9jxEkGU/fPqJhmt46wyfdc+sIq0GdxAOtGqmGPe4cQWU41erJKfpa0IMk3i1NF7ClpRFjHxN4K6zEe6+Zrfa5Cd5s1b923bAnBrTVhZsv5g/fZsl15r19m+3fbCts8+rBFmSH7LgF6+Wp1CSnIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484309; c=relaxed/simple;
	bh=sXzVNjqKx+odNTCZna3/rChmqdCTQoc6QPrywDlMSCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MU+lG8hhtxGBwDPlSsm/aAIwrBEQbdphr8EVpoZPRWjasUf1G5ixg4cyWlst1zJX6HPOTH/E9tfb2vPijtK/fyozzG42dCNU7WcsxL/2K9GUpWbFQhA+wTHhmHnluQAeQ+6/RAODJJlWqfIbSzvxzFnTbS+x3AOAC9iVLeeiDc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNA6kWNO; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNA6kWNO"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso3773262e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778484305; x=1779089105; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czL+AIKiPa3zxBWmGlbiYtIZwrkwsGMMp/SoH4pGWS8=;
        b=cNA6kWNOuCz1fuH3dSX+HswbnXtCO+hUz/ZwqMKU1jTT+Ox5E6C+mRtg859+XtX1k6
         pob6tP/gA1UV6PpTSJvKp0xQrkxdoa0clyfeyO1LUedepXh53VHLAWpXAawEtWlm79d9
         aXKack2ztNBfYG/eG+a3wUqgkyNH3MbG+EnoDBgSLnVX2fbY4P6UhdXWchloUiY/IhjP
         3BACM4AJNDmTVE83V+IxuxWd4jUv12cfYSfz8VGKe5qMRX91yefywWVbIZSEPzeRZMFh
         qitumZREcZrvrIg7+1veccpjOtOmLQgphxgFEzO70SjuzNFDaqMT0unkc7M8lUS3cM7f
         SBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484305; x=1779089105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czL+AIKiPa3zxBWmGlbiYtIZwrkwsGMMp/SoH4pGWS8=;
        b=ChX/zhGE/qPrFYh0Op4V3illwhp+pwx4/oF5dwA4FFTwYgua898HZCveIzuiyY5wuj
         Ga28wRJ7aNV7VZXWXyQZ8vNcpt7wKNXGdOmf/ThNawW20frWh0bKjk1Jlb/9DA2gwXwj
         ZkIV2GPg4sYw1xuYpZWiRXLFZ/jjYX0f4l6SguCw6D9U8KdghjczJ71M1sfcRCCjgETY
         DQUtPozdhmtRMByJSdZtq+iC0RDnMMilsgl3wfY/naZpiFGUhQoflk0rI7j9ByVqbgh9
         br+Wx3595Qst5c8uS5sxk6gylRhHlCO4hwFsWIo9Jxc3b+zRkwhFV0y7cUZkf4BvmASz
         PlPQ==
X-Gm-Message-State: AOJu0YybD7sowIXs4PDBmfPEtDnJRWclG2aSDfVZ+qmDyXlT2vlVAuga
	3dP4nQyvRbsGI9N7ltDrAceeiW0neN5LypAe85c4V7k+Af50GK2k3HUg
X-Gm-Gg: Acq92OGHjycPWiSfEKdwpx/uH3I0mrE0IX1K0IatFWCfcqSD4AJKoXTx/i63zigMN2J
	aSPFI07Lqay8qhEDLmGAA+xWxhXUqxvdAWNMYymC39R+bpfRNe1f+X3xLqnqOTlz0geDHxXEXXy
	g7gR7rVJUgKUYydQGwxMBD24qXSvmnhIY2kjxQeN6qewtHtcrYOOcwxNxFLXGr4Zrz3rU9bkdVu
	Iyq3Q0hMyYzsCkqsBX24IY6nSmVQBtVrDQJFc91vKmEEmK0fOMqp9nqiohhuHZnn1hgLjKGoVlO
	qOfajTeYi58zSHJidIlS0UtMsWD7HXvrjhGG4SEa7cwtx0sVOBPIhbLH6gc1BGpZMdiSyQ0o4wt
	8ah0mcl2y22W8TAuEbVykfyf8+8Ux16ACv6xIE1zGZnQ80lcpbZ48cIPO+zMIuhl/YzbstvD4cU
	DwqE8KMJYOuY+s6kZE1Q==
X-Received: by 2002:a05:6122:4d09:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-57559269776mr12808985e0c.0.1778484305453;
        Mon, 11 May 2026 00:25:05 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6c6c582sm19490031e0c.9.2026.05.11.00.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:25:03 -0700 (PDT)
Date: Mon, 11 May 2026 10:24:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: SOF: amd: Use AMD_NODE
Message-ID: <agGES8vWrLOrBu28@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mario Limonciello,

Commit f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE") from Feb 17,
2025 (linux-next), leads to the following Smatch static checker
warning:

	sound/soc/sof/amd/acp.c:232 psp_send_cmd()
	warn: kernel error codes cast to unsigned 'data'

sound/soc/sof/amd/acp.c
    222 static int psp_send_cmd(struct acp_dev_data *adata, int cmd)
    223 {
    224         struct snd_sof_dev *sdev = adata->dev;
    225         int ret;
    226         u32 data;
    227 
    228         if (!cmd)
    229                 return -EINVAL;
    230 
    231         /* Get a non-zero Doorbell value from PSP */
--> 232         ret = read_poll_timeout(smn_read_register, data, data > 0, MBOX_DELAY_US,
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The smn_read_register() returns negative error codes or positive
values on success.  We're storing the return in data and testing data > 0
to see if it succeeds.  But since data is unsigned then negative error
codes are treated as success.

    233                                 ACP_PSP_TIMEOUT_US, false, MP0_C2PMSG_73_REG);
    234 
    235         if (ret) {
    236                 dev_err(sdev->dev, "Failed to get Doorbell from MBOX %x\n", MP0_C2PMSG_73_REG);
    237                 return ret;
    238         }
    239 
    240         /* Check if PSP is ready for new command */
    241         ret = psp_mbox_ready(adata, 0);
    242         if (ret)
    243                 return ret;
    244 

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
