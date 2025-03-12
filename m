Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36C23278D
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768369; cv=none; b=ZtSVJSNjDbBTRaoMISGk4dFSzRwwHfmXe2TsSe/k8vGGQ6M40WYhnr28VtBMtKA4q+gU3vUa67ccwOL4pdtG/LovWvCx16K8+cnnWN3X4PVRNFvY8PxDspC+BG4Un3vZEjUlpBxOGrDAiuNl/0h4RnmeMU6oPeas5+VM/FKr5wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768369; c=relaxed/simple;
	bh=P1bJsi7rmmkeirEqSQYfr92f6q+h9LPLEzrD9H97WUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUs7EXs9OMfpjq7nak6Vux8ssQ3BhRRlmdmrb1TpTaFcKmxR2VAJObWw6yVg9z7y8f5WyKxFIn1mf9ATFZJf1SUNQt92j8fKphnstqrf4AVXSU47TuGOGOmUeVLmAiVcpTG08wU+WexFcAcr3SMBJI6UBn0+b9QQ4qoPlqYC2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S04Y1mZf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S04Y1mZf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so32320535e9.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741768366; x=1742373166; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6FbGiB8NZGHWYUZ4PyF2aOowTT1UMyFjGU8j+cWXMc=;
        b=S04Y1mZfQdiO4rPl7Hu/KQqiJSOoDsM5mjv4vP5xtHT//nvRjuGEp4L2S7jBmS1X6a
         zm8Ka2hfjqTN6FB45SA/0C7P6bLGSmeGFdmMe5/mLiXx+y9D7UiHv3y9+i+hR6/DLiEY
         pPHTbA9LRS5ZnWNlQqN0vrcKL2tswzkaDlCq6pB/NOQCj2i7Fa882sk0qSCyAbbYMUft
         LdQ1ni3eGlhxqyrkJk8K7qtl4TuEOhqXwB77wQ0bJYAGpkcuEOoAaGuI8FWjwbmYjrSh
         VPyrsNSIA0ZKa9oEA57lyw0M0o+XHB8ASIg19INsdL6nEZUXMWED/YH/yPcp6NkInxE1
         0DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768366; x=1742373166;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6FbGiB8NZGHWYUZ4PyF2aOowTT1UMyFjGU8j+cWXMc=;
        b=oacVC6Onx8bDjQAObM5pywiIjAhBX2ETHqVUr6IgWfOSS+pLASrmomXW4UANdn++Vp
         CIpbmQxsArdXteqq3rTSSPfLMTHxKQclS+D4yV3ehQYrrE2uGh8+DjEDC1bosmzd9MFy
         Y1pno4E1LIFjom9ZyuyKqoEiQgA3WsJhkyfZCmunxVucjdZvehX6XaJo5cGTBvU90D6q
         1zZMFTS85QsgbXccsZpc2Bs9Vg/zWlGGYKcOQbDBDZ2PbXji3yMpMMPAEt3LNTWDufrA
         wPt4+B32Ecr1irMVE2nuH2ETh566dZBQGMbkqEq6dIP70ldiwTy/L22r6vXyHH6A/zk1
         wL0Q==
X-Gm-Message-State: AOJu0YzucdUIOrOB7U571Jf8GhIxtdGcs3RwrJhKz6Wxdc2aA9vCwA+F
	9emiaV2yoSpTOe9gv8uOrCXh6F3M8xPhNRJQArbnnCYiTpa8PqrWEupsS15QsxGBY0CO4Ve+5nh
	m
X-Gm-Gg: ASbGncvB9f4TYU3/UFryWMSXTq2IQDkbngRe+fczfVYMaERoDMVAklO4Oa2+sv/bcXe
	qlmk5m8b7SFpcZyNgVv8infUNs7+4BW2h2S32WV1Wu4I8Acf8/zYl5DqHSaynDTWf6n3gC0jxKN
	htLsxTvV+uncdJ0Koj6QZXJ2PTuhYHI/HaIYjUlzFNLluhsLSvxL6C/270K5PARv8s0Exxpw/Pa
	q4xaA9YnEHOXnzWijVHUlVuFRi9M9+3omP1eP3lLianA5RkKdovtfojybFApEt5M5/EvC8ynRhH
	Pu/SCxZ6afLGuqGdU1OgMQ8Gg+jUrODuVqUkZbcwUQzztXuxyg==
X-Google-Smtp-Source: AGHT+IF5pDMfj6wslWljqfprR8bXyNwnVj0sY/QrSSX/88EDQXVzkyd5LPFMlP+U8SnCGU8Y8wvlWA==
X-Received: by 2002:a05:600c:4f16:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43cfd72f2ccmr132386305e9.11.1741768365666;
        Wed, 12 Mar 2025 01:32:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d0a72ec8bsm14096155e9.5.2025.03.12.01.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:32:45 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:32:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] soundwire: debugfs: add interface for BPT/BRA transfers
Message-ID: <0db6d0bf-7bac-43a7-b624-a00d3d2bf829@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Pierre-Louis Bossart,

Commit bb5cb09eedce ("soundwire: debugfs: add interface for BPT/BRA
transfers") from Feb 27, 2025 (linux-next), leads to the following
Smatch static checker warning:

drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'finish_t'.
drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'start_t'.

drivers/soundwire/debugfs.c
    236 static int cmd_go(void *data, u64 value)
    237 {
    238         const struct firmware *fw = NULL;
    239         struct sdw_slave *slave = data;
    240         ktime_t start_t;
    241         ktime_t finish_t;
    242         int ret;
    243 
    244         if (value != 1)
    245                 return -EINVAL;
    246 
    247         /* one last check */
    248         if (start_addr > SDW_REG_MAX ||
    249             num_bytes == 0 || num_bytes > MAX_CMD_BYTES)
    250                 return -EINVAL;
    251 
    252         ret = pm_runtime_get_sync(&slave->dev);
    253         if (ret < 0 && ret != -EACCES) {
    254                 pm_runtime_put_noidle(&slave->dev);
    255                 return ret;
    256         }
    257 
    258         if (cmd == 0) {
    259                 ret = request_firmware(&fw, firmware_file, &slave->dev);
    260                 if (ret < 0) {
    261                         dev_err(&slave->dev, "firmware %s not found\n", firmware_file);
    262                         goto out;

start_t and finish_t are not initialized

    263                 }
    264                 if (fw->size < num_bytes) {
    265                         dev_err(&slave->dev,
    266                                 "firmware %s: firmware size %zd, desired %zd\n",
    267                                 firmware_file, fw->size, num_bytes);
    268                         goto out;
    269                 }
    270         }
    271 
    272         /* Userspace changed the hardware state behind the kernel's back */
    273         add_taint(TAINT_USER, LOCKDEP_STILL_OK);
    274 
    275         dev_dbg(&slave->dev, "starting command\n");
    276         start_t = ktime_get();
    277 
    278         if (cmd == 0) {
    279                 if (cmd_type)
    280                         ret = do_bpt_sequence(slave, true, (u8 *)fw->data);
    281                 else
    282                         ret = sdw_nwrite_no_pm(slave, start_addr, num_bytes, fw->data);
    283         } else {
    284                 memset(read_buffer, 0, sizeof(read_buffer));
    285 
    286                 if (cmd_type)
    287                         ret = do_bpt_sequence(slave, false, read_buffer);
    288                 else
    289                         ret = sdw_nread_no_pm(slave, start_addr, num_bytes, read_buffer);
    290         }
    291 
    292         finish_t = ktime_get();
    293 
    294 out:
    295         if (fw)
    296                 release_firmware(fw);
    297 
    298         pm_runtime_mark_last_busy(&slave->dev);
    299         pm_runtime_put(&slave->dev);
    300 
--> 301         dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
    302                 num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
                                                ^^^^^^^^^^^^^^^^^^
Uninitialized

    303 
    304         return ret;
    305 }

regards,
dan carpenter
