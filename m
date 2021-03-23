From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 23 Mar 2021 09:04:15 +0000
Subject: Re: [PATCH v3] drivers: most: add ALSA sound driver
Message-Id: <YFmvD/oYW8ihe+ez@kroah.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1612865627-29950-1-git-send-email-christian.gromm@microchip.com>
In-Reply-To: <1612865627-29950-1-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Gromm <christian.gromm@microchip.com>
Cc: driverdev-devel@linuxdriverproject.org, linux-sound@vger.kernel.org

On Tue, Feb 09, 2021 at 11:13:47AM +0100, Christian Gromm wrote:
> This patch moves the ALSA sound driver out of the staging area and adds it
> to the stable part of the MOST driver. Modifications to the Makefiles and
> Kconfigs are done accordingly to not break the build.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> ---
> v2:
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>         
>         submitted patch that fixes issue found during code audit
>         to staging version first to be able to resend single patch that
>         adds the driver. The patch series included:
> 
>         - use swabXX functions of kernel
> 
> v3:
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> 	- use non-safe list iteration
> 	- add sanity check for function argument

Given a lack of complaints about this, I've now queued this up in my
staging tree for the next -rc1 merge window, thanks!

greg k-h
